<!-- Search box and add button, search box, and input fields for username and phone number -->
<template>
    <div>
  
      <!-- Results List -->
      <el-card>
        <el-table :data="bodyList" stripe style="width: 100%">
          <el-table-column type="index" label="No." width="50"></el-table-column>
          <el-table-column prop="date" label="Upload Time" width="100" :formatter="formatDate"></el-table-column>
          <el-table-column prop="name" label="Name" width="80"></el-table-column>
          <el-table-column prop="age" label="Age" width="80"></el-table-column>
  
          <el-table-column
            prop="gender"
            label="Gender"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="height"
            label="Height/cm"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="weight"
            label="Weight/kg"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="bloodSugar"
            label="Blood Sugar"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="bloodPressure"
            label="Blood Pressure"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="weight"
            label="Weight/kg"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="bloodLipid"
            label="Blood Lipid"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="heartRate"
            label="Heart Rate/min"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="vision"
            label="Vision"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="sleepDuration"
            label="Sleep Duration"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="sleepQuality"
            label="Sleep Quality"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="heartRate"
            label="Heart Rate/min"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="heartRate"
            label="Heart Rate/min"
            width="80"
          ></el-table-column>
  
          <el-table-column prop="smoking" label="Smoking" width="80">
            <template slot-scope="scope">
              <span v-if="scope.row.smoking">Yes</span>
              <span v-else>No</span>
            </template></el-table-column
          >
  
          <el-table-column prop="drinking" label="Drinking" width="80">
            <template slot-scope="scope">
              <span v-if="scope.row.drinking">Yes</span>
              <span v-else>No</span>
            </template></el-table-column
          >
  
          <el-table-column prop="exercise" label="Exercise" width="80">
            <template slot-scope="scope">
              <span v-if="scope.row.exercise">Yes</span>
              <span v-else>No</span>
            </template></el-table-column
          >
  
          <el-table-column
            prop="foodTypes"
            label="Preferred Food"
            width="80"
          ></el-table-column>
  
          <el-table-column
            prop="waterConsumption"
            label="Water Intake"
            width="80"
          ></el-table-column>
  
          <el-table-column label="Actions" width="180">
            <!-- Delete and Edit Buttons -->
            <template slot-scope="scope">
              <el-button
                @click="openEditUi(scope.row.notesid)"
                type="primary"
                icon="el-icon-edit"
                circle
              ></el-button>
              <el-button
                @click="deleteUserBody(scope.row)"
                type="danger"
                icon="el-icon-delete"
                circle
              ></el-button>
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
  
      <!-- User Edit Information Dialog -->
      <el-dialog
        @close="clearForm"
        :title="title"
        :visible.sync="dialogFormVisible"
      >
        <el-form :model="bodyForm" ref="bodyFormRef">
          <el-form-item label="Name" prop="name" :label-width="formLabelWidth">
            <el-input v-model="bodyForm.name" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item label="Age" prop="age" :label-width="formLabelWidth">
            <el-input v-model="bodyForm.age" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item label="Gender" prop="gender" :label-width="formLabelWidth">
            <el-input v-model="bodyForm.gender" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Height/cm"
            prop="height"
            :label-width="formLabelWidth"
          >
            <el-input v-model="bodyForm.height" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Weight/kg"
            prop="weight"
            :label-width="formLabelWidth"
          >
            <el-input v-model="bodyForm.weight" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Blood Sugar"
            prop="bloodSugar"
            :label-width="formLabelWidth"
          >
            <el-input v-model="bodyForm.bloodSugar" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Blood Pressure"
            prop="bloodPressure"
            :label-width="formLabelWidth"
          >
            <el-input
              v-model="bodyForm.bloodPressure"
              autocomplete="off"
            ></el-input>
          </el-form-item>
  
          <el-form-item
            label="Blood Lipid"
            prop="bloodLipid"
            :label-width="formLabelWidth"
          >
            <el-input v-model="bodyForm.bloodLipid" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Heart Rate/min"
            prop="weight"
            :label-width="formLabelWidth"
          >
            <el-input v-model="bodyForm.heartRate" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item label="Vision" prop="vision" :label-width="formLabelWidth">
            <el-input v-model="bodyForm.vision" autocomplete="off"></el-input>
          </el-form-item>
  
          <el-form-item
            label="Sleep Duration/h"
            prop="sleepDuration"
            :label-width="formLabelWidth"
          >
            <el-input
              v-model="bodyForm.sleepDuration"
              autocomplete="off"
            ></el-input>
          </el-form-item>
  
          <el-form-item
            label="Sleep Quality"
            prop="sleepQuality"
            :label-width="formLabelWidth"
          >
            <el-radio-group v-model="bodyForm.sleepQuality">
              <el-radio :label="1">Good</el-radio>
              <el-radio :label="2">Average</el-radio>
              <el-radio :label="3">Poor</el-radio>
            </el-radio-group>
          </el-form-item>
  
          <el-form-item
            label="Smoking"
            prop="smoking"
            :label-width="formLabelWidth"
          >
            <el-switch
              v-model="bodyForm.smoking"
  
            ></el-switch>
          </el-form-item>
  
          <el-form-item
            label="Drinking"
            prop="drinking"
            :label-width="formLabelWidth"
          >
            <el-switch
              v-model="bodyForm.drinking"
  
            ></el-switch>
          </el-form-item>
  
          <el-form-item
            label="Exercise"
            prop="exercise"
            :label-width="formLabelWidth"
          >
            <el-switch v-model="bodyForm.exercise"></el-switch>
          </el-form-item>
  
          <el-form-item
            label="Preferred Food"
            prop="foodTypes"
            :label-width="formLabelWidth"
          >
            <el-select
              v-model="bodyForm.foodTypes"
              placeholder="Please select the food type you consume more"
            >
              <el-option label="Vegetables" value="Vegetables"></el-option>
              <el-option label="Fruits" value="Fruits"></el-option>
              <el-option label="Meat" value="Meat"></el-option>
              <el-option label="Fish" value="Fish"></el-option>
              <el-option label="Beans" value="Beans"></el-option>
              <el-option label="Grains" value="Grains"></el-option>
            </el-select>
          </el-form-item>
  
          <el-form-item
            label="Water Intake/ml"
            prop="waterConsumption"
            :label-width="formLabelWidth"
          >
            <el-input
              v-model="bodyForm.waterConsumption"
              autocomplete="off"
            ></el-input>
          </el-form-item>
        </el-form>
  
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">Cancel</el-button>
          <el-button type="primary" @click="updateBody">Confirm</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import userApi from "@/api/userManage";
  export default {
    data() {
      return {
        bodyForm: {}, //初始化为一个空对象
        bodyList: [],
        //左边宽度
        formLabelWidth: "135px",
        //设置默认值不可见
        dialogFormVisible: false,
        title: "",
        total: 0,
        searchModel: {
          pageNo: 1,
          // 默认显示数量
          pageSize: 10,
        },
        //表单规则配置
  
        rules: {
          bodyType: [
            { required: true, message: "Please enter sport type", trigger: "blur" },
          ],
        },
      };
    },
  
    methods: {
      updateBody() {
        let isOk = true;
        //触发表单的验证
        this.$refs.bodyFormRef.validate((valid) => {
          // 这边只有校验失败的时候才会进来,在外面定义一个 isok,校验失败会将他改成 false
          isOk = valid;
        });
  
        if (isOk) {
          //提交验证给后台
          userApi.updateUserBody(this.bodyForm).then((response) => {
            //成功Confirm
            this.$message({
              message: response.message,
              type: "success",
            });
            //关闭对话框
            this.dialogFormVisible = false;
            //刷新表格数据
            this.getUserBodyList();
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      },
  
      //清理表单数据
      clearForm() {
        this.bodyForm = {};
        //清除表单校验的Confirm信息
        this.$refs.bodyFormRef.clearValidate();
      },
      handleSizeChange(pageSize) {
        //数据更新
        this.searchModel.pageSize = pageSize;
        this.getUserBodyList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getUserBodyList();
      },
  
      //用于查询用户列表
      getUserBodyList() {
        userApi.getUserBodyList(this.searchModel).then((response) => {
          console.log(response);
          this.bodyList = response.data.rows;
          // 将查询结果中的 total 属性赋值给 total
          this.total = response.data.total;
          console.log(this.bodyList);
        });
      },
  
      openEditUi(notesid) {
        console.log(notesid)
        this.title = "Edit Body Information";
        //根据id查询用户数据
        userApi.getUserBodyById(notesid).then((response) => {
          this.bodyForm = response.data;
        });
  
        this.dialogFormVisible = true;
      },
  
      deleteUserBody(body) {
        this.$confirm(`Are you sure you want to delete ${body.name} this body information?`, "Confirm", {
          confirmButtonText: "Confirm",
          cancelButtonText: "Cancel",
          type: "warning",
        })
          .then(() => {
            userApi.deleteUserBodyById(body.notesid).then((response) => {
              this.$message({
                type: "success",
                message: response.message,
              });
              this.getUserBodyList();
              
            });
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "已Cancel删除",
            });
          });
      },

      formatDate(row, column, cellValue, index) {
    // 将时间戳转换成日期字符串
    const date = new Date(cellValue);
    return date.toLocaleDateString();
  }
    },
  
    //加载时就查询一次
    created() {
      this.getUserBodyList();
    },
  };
  </script>
  <style scoped>
  #search .el-input {
    width: 200px;
    margin-right: 20px;
  }
  .el-dialog .el-input {
    width: 43%;
  }
  
  
  /* 很美观的CSS卡片 */
  .el-card {
    width: 80%;
    margin: 20px auto;
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    overflow: hidden;
  }
  
  /* 很美观的CSS表格 */
  .el-table {
    width: 100%;
    border-collapse: collapse;
  }
  
  /* 很美观的CSS表格标题 */
  .el-table-column {
    background-color: lightblue;
    color: white;
    padding: 10px;
    border: 1px solid white;
    text-align: center;
  }
  
  /* 很美观的CSS表格数据 */
  .el-table-column[type="index"],
  .el-table-column[prop="id"],
  .el-table-column[prop="username"],
  .el-table-column[prop="phone"],
  .el-table-column[prop="email"] {
    background-color: white;
    color: black;
    padding: 10px;
    border: 1px solid lightblue;
    text-align: center;
  }
  
  /* 很美观的CSS表格数据悬停效果 */
  .el-table-column[type="index"]:hover,
  .el-table-column[prop="id"]:hover,
  .el-table-column[prop="username"]:hover,
  .el-table-column[prop="phone"]:hover,
  .el-table-column[prop="email"]:hover {
    background-color: lightpink;
    color: white;
  }
  
  /* 很美观的CSS按钮悬停效果 */
  .el-button:hover {
    transform: scale(1.2);
  }
  
  /* 和这个代码一样的CSS */
  .el-pagination {
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 20px;
  }
  
  /* 和这个代码一样的CSS总数 */
  .el-pagination__total {
    color: #606266;
    margin-right: 20px;
  }
  
  /* 和这个代码一样的CSS每页显示条数 */
  .el-pagination__sizes {
    display: flex;
    align-items: center;
    margin-right: 20px;
  }
  
  /* 和这个代码一样的CSS每页显示条数选择器 */
  .el-pagination__sizes .el-select {
    width: 100px;
  }
  
  /* 和这个代码一样的CSS上一页按钮 */
  .el-pagination__prev {
    display: flex;
    align-items: center;
    margin-right: 10px;
  }
  
  /* 和这个代码一样的CSS上一页按钮图标 */
  .el-pagination__prev .el-icon {
    font-size: 20px;
    color: #409eff;
  }
  
  /* 和这个代码一样的CSS页码 */
  .el-pagination__pager {
    display: flex;
    align-items: center;
    margin-right: 10px;
  }
  
  /* 和这个代码一样的CSS页码按钮 */
  .el-pagination__pager button {
    width: 30px;
    height: 30px;
    border-radius: 4px;
    border: none;
    background-color: white;
    color: #606266;
    margin: 2px;
    transition: all 0.3s ease-in-out;
  }
  
  /* 和这个代码一样的CSS页码按钮悬停效果 */
  .el-pagination__pager button:hover {
    background-color: #409eff;
    color: white;
  }
  
  /* 和这个代码一样的CSS当前页码按钮 */
  .el-pagination__pager button.is-active {
    background-color: #409eff;
    color: white;
  }
  
  /* 和这个代码一样的CSS下一页按钮 */
  .el-pagination__next {
    display: flex;
    align-items: center;
    margin-right: 10px;
  }
  
  /* 和这个代码一样的CSS下一页按钮图标 */
  .el-pagination__next .el-icon {
    font-size: 20px;
    color: #409eff;
  }
  
  /* 和这个代码一样的CSS跳转输入框 */
  .el-pagination__jump {
    display: flex;
    align-items: center;
  }
  
  /* 和这个代码一样的CSS跳转输入框标签 */
  .el-pagination__jump label {
    color: #606266;
  }
  
  /* 和这个代码一样的CSS跳转输入框输入框 */
  .el-pagination__jump input {
    width: 50px;
    height: 30px;
    border-radius: 4px;
    border: none;
  }
  </style>