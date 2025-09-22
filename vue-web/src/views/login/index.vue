<template>
  <div class="login-container">
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >
      <div class="title-container">
        <h3 class="title">Welcome to Personal Health Management System</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="Username"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="Password"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon
            :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"
          />
        </span>
      </el-form-item>

      <el-button
        :loading="loading"
        type="primary"
        style="width: 100%; margin-bottom: 30px"
        @click.native.prevent="handleLogin"
        >Login</el-button
      >
      <div>
        <el-button
          type="primary"
          style="width: 100%; margin-bottom: 30px; margin-left: 0px"
          @click.native.prevent="handleRegister"
          >Register</el-button
        >
      </div>
    </el-form>
  </div>
</template>

<script>
import { validUsername } from "@/utils/validate";

export default {
  name: "Login",
  data() {
    // Define username validation function
    const validateUsername = (rule, value, callback) => {
      // Call validUsername function to check if username is valid
      if (!validUsername(value)) {
        // If invalid, return error message
        callback(new Error("Please enter a valid username"));
      } else {
        // If valid, call callback() function to return validation success message
        callback();
      }
    };
    // Define password validation function
    const validatePassword = (rule, value, callback) => {
      // Check if password is less than 6 characters
      if (value.length < 6) {
        // If less than 6 characters, return error message
        callback(new Error("Password must be at least 6 characters"));
      } else {
        // If valid, call callback() function to return validation success message
        callback();
      }
    };
    return {
      // Define form data object
      loginForm: {
        username: "",
        password: "",
      },
      // Define form validation rules
      loginRules: {
        username: [
          { required: true, trigger: "blur", validator: validateUsername },
        ],
        password: [
          { required: true, trigger: "blur", validator: validatePassword },
        ],
      },
      // Define loading state
      loading: false,
      // Define password input type, initially password field
      passwordType: "password",
      // Define redirect path, initially undefined
      redirect: undefined,
    };
  },

  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true,
    },
  },

  methods: {
    
    showPwd() {
      if (this.passwordType === "password") {
        this.passwordType = "";
      } else {
        this.passwordType = "password";
      }
      this.$nextTick(() => {
        this.$refs.password.focus();
      });
    },

    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true; // Show loading spinner
          this.$store
            .dispatch("user/login", this.loginForm)
            .then(() => {
              localStorage.setItem('username', this.loginForm.username);
              // Login successful, navigate to target route
              this.$router.push({ path: this.redirect || "/" });
              this.loading = false; // Hide loading state
            })
            .catch(() => {
              this.loading = false; // Hide loading state
            });
        } else {
          console.log("error submit!!");
          return false; 
        }
      });
    },

    handleRegister() {
      this.$router.push({ path: "/register" });
    },
  },
};
</script>

<style lang="scss">
$primary: #667eea;
$primary-light: #764ba2;
$dark_gray: #64748b;
$light_gray: #f8fafc;

.login-container {
  min-height: 100vh;
  width: 100%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Ccircle cx='30' cy='30' r='2'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    animation: float 20s ease-in-out infinite;
  }

  .login-form {
    position: relative;
    width: 420px;
    max-width: 90%;
    padding: 48px 40px;
    margin: 0 auto;
    overflow: hidden;
    background: rgba(255, 255, 255, 0.95);
    /* Fallback for browsers that don't support backdrop-filter */
    background-color: rgba(255, 255, 255, 0.98);
    -webkit-backdrop-filter: blur(20px);
    backdrop-filter: blur(20px);
    border-radius: 24px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
    z-index: 1;
  }

  .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;

    span {
      &:first-of-type {
        margin-right: 16px;
      }
    }
  }

  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .title-container {
    position: relative;
    margin-bottom: 40px;

    .title {
      font-size: 28px;
      background: linear-gradient(135deg, $primary 0%, $primary-light 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      /* Fallback for browsers that don't support background-clip: text */
      color: $primary;
      margin: 0;
      text-align: center;
      font-weight: 700;
      letter-spacing: -0.02em;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }

  .el-form-item {
    margin-bottom: 20px;
  }

  .el-input {
    width: 100%;
    border: none;
    border-radius: 12px;
    background-color: $light_gray;
    transition: all 0.3s ease;

    &:hover {
      background-color: #f1f5f9;
    }

    input {
      padding: 16px 20px;
      color: #1e293b;
      font-size: 16px;
      border: none;
      background: transparent;

      &::placeholder {
        color: #94a3b8;
        font-weight: 400;
      }

      &:focus {
        outline: none;
      }
    }
  }

  .el-button {
    height: 52px;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    background: linear-gradient(135deg, $primary 0%, $primary-light 100%);
    border: none;
    color: white;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);

    &:hover,
    &:focus {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
    }

    &:active {
      transform: translateY(0);
    }
  }
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}
</style>
