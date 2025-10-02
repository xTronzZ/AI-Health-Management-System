import router from './router'
import store from './store'
import { Message } from 'element-ui'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css' // progress bar style
import { getToken } from '@/utils/auth' // get token from cookie
import getPageTitle from '@/utils/get-page-title'

import Layout from '@/layout'


NProgress.configure({ showSpinner: false }) // NProgress Configuration

const whiteList = ['/login','/register','/change_Password'] // no redirect whitelist

router.beforeEach(async(to, from, next) => {
  // start progress bar
  NProgress.start()

  // set page title
  document.title = getPageTitle(to.meta.title)

  // determine whether the user has logged in
  const hasToken = getToken()

  if (hasToken) {
    if (to.path === '/login') {
      // if is logged in, redirect to the home page
      next({ path: '/' })
      NProgress.done()
    } else {
      const hasGetUserInfo = store.getters.name
      if (hasGetUserInfo) {
        next()
      } else {
        try {
          // get user info
          await store.dispatch('user/getInfo')

          // Route conversion
          let myRoutes = myFilterAsyncRoutes(store.getters.menuList);
          // 404
          myRoutes.push({
              path: '*',
              redirect: '/404',
              hidden: true
          });
          // Dynamically add routes
          router.addRoutes(myRoutes);
          // Store to global variable
          global.myRoutes = myRoutes;
          // Prevent blank page after refresh
          next({...to,replace:true})  

        } catch (error) {
          // remove token and go to login page to re-login
          await store.dispatch('user/resetToken')
          Message.error(error || 'Has Error')
          next(`/login?redirect=${to.path}`)
          NProgress.done()
        }
      }
    }
  } else {
    /* has no token*/

    if (whiteList.indexOf(to.path) !== -1) {
      // in the free login whitelist, go directly
      next()
    } else {
      // other pages that do not have permission to access are redirected to the login page.
      next(`/login?redirect=${to.path}`)
      NProgress.done()
    }
  }
})

router.afterEach(() => {
  // finish progress bar
  NProgress.done()
})



function myFilterAsyncRoutes(menuList) {
  menuList.filter(menu => { // Filter the menuList array
    if (menu.component === 'Layout') { // If menu's component property is 'Layout'
      menu.component = Layout // Then assign it to Layout component
      // console.log(menu.component); // Print out menu's component property
    } else {
      menu.component = require(`@/views/${menu.component}.vue`).default // Otherwise, dynamically load the corresponding vue component based on menu's component property
    }
    // Recursively process submenus
    if (menu.children && menu.children.length) { // If menu has submenus and submenu array length is greater than 0
      menu.children = myFilterAsyncRoutes(menu.children) // Then recursively call myFilterAsyncRoutes function to process submenus
    }
    return true // filter function returns true, allowing menu to be retained in the new array
  })
  return menuList; // Return the processed menu array
}

