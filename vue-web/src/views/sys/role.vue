<!-- Search box and add button, search box, and input fields for username and phone number -->
<template>
  <div>
    <el-card id="search">
      <el-row>
        <el-col :span="23">
          <!-- v-model binding component implements two-way data binding, user input values on the page will be synchronized to this property -->
          <el-input
            v-model="searchModel.roleName"
            placeholder="Role Name"
            clearable
          ></el-input>
          <el-button
            @click="getRoleList"
            type="primary"
            round
            icon="el-icon-search"
            >Search</el-button
          >
        </el-col>
        <el-col :span="1">
          <el-button
            @click="openEditUi(null)"
            type="primary"
            icon="el-icon-plus"
            circle
          ></el-button>
        </el-col>
      </el-row>
    </el-card>

    <!-- Results List -->
    <el-card>
      <el-table :data="roleList" stripe style="width: 100%">
        <el-table-column prop="roleId" label="Role ID" width="180"></el-table-column>
        <el-table-column prop="roleName" label="Role Name" width="180"></el-table-column>
        <el-table-column prop="roleDesc" label="Role Description"></el-table-column>
        <el-table-column label="Actions" width="180">
          <!-- Delete and Edit Buttons -->
          <template slot-scope="scope">
          <el-button @click="openEditUi(scope.row.roleId)" type="primary" icon="el-icon-edit" circle></el-button>
          <el-button @click="deleteRole(scope.row)" type="danger" icon="el-icon-delete" circle></el-button>
        </template>

        </el-table-column>
      </el-table>
    </el-card>

    <!-- Pagination -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="searchModel.pageNo"
      :page-sizes="[5, 10, 20, 30]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    >
    </el-pagination>

    <!-- Role Edit Dialog -->
    <el-dialog
      @close="clearForm" :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="roleForm" ref="roleFormRef" :rules="rules">
        <el-form-item label="Role Name" prop="roleName" :label-width="formLabelWidth">
          <el-input v-model="roleForm.roleName" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="Role Description" prop="roleDesc" :label-width="formLabelWidth">
          <el-input v-model="roleForm.roleDesc" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="Permission Settings" prop="menuIdList" :label-width="formLabelWidth">
          <el-tree :data="menuList" :props="menuProps" show-checkbox default-expand-all node-key="menuId" ref="menuRef"></el-tree>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="saveRole">Confirm</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import roleApi from "@/api/roleManage";
import menuApi from "@/api/menuManage";
export default {
  data() {
    return {
      menuList:[],
      // Left width
      formLabelWidth: "135px",
      // Set default value to invisible
      dialogFormVisible: false,
      roleForm: {},
      title: "",
      total: 0,
      roleList: [],

      menuProps:{
          children: 'children',
          label: 'title'
      },

      searchModel: {
        pageNo: 1,
        // Default display count
        pageSize: 10,
      },

      // Form validation rules configuration
      rules: {
        roleName: [
          { required: true, message: "Please enter role name", trigger: "blur" },
          {
            min: 2,
            max: 20,
            message: "Length must be between 2 and 18 characters",
            trigger: "blur",
          },
        ],
        roleDesc: [
          { required: true, message: "Please enter role description", trigger: "blur" },
          {
            min: 2,
            max: 20,
            message: "Length must be between 2 and 18 characters",
            trigger: "blur",
          },
        ],
      },
    };
  },

  methods: {
    getAllMenu() {
      menuApi.getAllMenu().then((response) => {
        this.menuList = response.data;
        
      });
    },

    


saveRole() {
  let isOk = true;
  // Trigger form validation
  this.$refs.roleFormRef.validate((valid) => {
    // Check if form validation passes, if validation fails, set isOk to false
    isOk = valid;
  });
  // If form validation passes
  if (isOk) {
    // Get selected menu nodes and half-selected menu nodes
    let checkedKeys = this.$refs.menuRef.getCheckedKeys();
    let halfCheckedKeys = this.$refs.menuRef.getHalfCheckedKeys();
    
    // Merge selected and half-selected menu nodes into one array
    this.roleForm.menuIdList = checkedKeys.concat(halfCheckedKeys);
    // Submit validation to backend, save role
    roleApi.saveRole(this.roleForm).then(response=> {
      // Success message
      this.$message({
        message: response.message,
        type: "success"
      });
      // Close dialog
      this.dialogFormVisible = false;
      // Refresh table data
      this.getRoleList();
    });
  } else {
    // Form validation failed
    console.log("Form validation failed");
    return false;
  }
},




    // Clear form data
    clearForm() {
      this.roleForm = {};
      // Clear form validation messages
      this.$refs.roleFormRef.clearValidate();
      this.$refs.menuRef.setCheckedKeys([]);
    },
    handleSizeChange(pageSize) {
      // Data update
      this.searchModel.pageSize = pageSize;
      this.getRoleList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getRoleList();
    },
    // Query user list
    getRoleList() {
      roleApi.getRoleList(this.searchModel).then((response) => {
        this.roleList = response.data.rows;
        this.total = response.data.total;
      });
    },

    openEditUi(id) {
      if(id == null){
        this.title = "Add Role";
      }else{
        this.title = "Edit Role";
        // Query role data by id
        roleApi.getRoleById(id).then(response =>{
          this.roleForm = response.data;
          this.$refs.menuRef.setCheckedKeys(response.data.menuIdList);
        });
      }
      this.dialogFormVisible = true;
    },

    deleteRole(role){
      this.$confirm(`Are you sure you want to delete role ${role.roleName}?`, 'Confirm', {
          confirmButtonText: 'Confirm',
          cancelButtonText: 'Cancel',
          type: 'warning'
        }).then(() => {
          roleApi.deleteRoleById(role.roleId).then(response =>{
            this.$message({
              type:'success',
              message:response.message
            });
            this.getRoleList();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: 'Deletion cancelled'
          });          
        });
    }
  },

  // Query once when loading
  created() {
    this.getRoleList();
    this.getAllMenu();
  },
};
</script>
<style>
#search .el-input {
  width: 200px;
  margin-right: 20px;
}
.el-dialog .el-input {
  width: 43%;
}
</style>