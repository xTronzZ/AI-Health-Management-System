<!-- Search box and add button, search box, and input fields for username and phone number -->
<template>
  <div>
    <el-card id="search">
      <el-row>
        <el-col :span="23">
          <!-- v-model binding component implements two-way data binding, user input values on the page will be synchronized to this property -->
          <el-input
            v-model="searchModel.name"
            placeholder="Please enter nickname"
            clearable
          ></el-input>
          <el-input
            v-model="searchModel.id"
            placeholder="Please enter ID"
            clearable
          ></el-input>
          <el-button
            @click="getBodyList"
            type="primary"
            round
            icon="el-icon-search"
            >Search</el-button
          >
        </el-col>
      </el-row>
    </el-card>

    <!-- Results List -->
    <el-card>
      <el-table :data="bodyList" stripe style="width: 100%">
        <el-table-column type="index" label="No." width="80"></el-table-column>
        <el-table-column prop="id" label="ID" width="80"></el-table-column>
        <el-table-column prop="name" label="Nickname" width="80"></el-table-column>
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
            <span v-if="scope.row.smoking">Yes</span>
            <span v-else>No</span>
          </template></el-table-column
        >

        <el-table-column prop="exercise" label="Exercise" width="80">
          <template slot-scope="scope">
            <span v-if="scope.row.smoking">Yes</span>
            <span v-else>No</span>
          </template></el-table-column
        >

        <el-table-column
          prop="foodTypes"
          label="Food Preference"
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
              @click="openEditUi(scope.row.id)"
              type="primary"
              icon="el-icon-edit"
              circle
            ></el-button>
            <el-button
              @click="deleteBody(scope.row)"
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

    <!-- User Edit Dialog -->
    <el-dialog
      @close="clearForm"
      :title="title"
      :visible.sync="dialogFormVisible"
    >
      <el-form :model="bodyForm" ref="bodyFormRef">
        <el-form-item label="Nickname" prop="name" :label-width="formLabelWidth">
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
            <el-radio :label="2">Fair</el-radio>
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
          label="Food Preference"
          prop="foodTypes"
          :label-width="formLabelWidth"
        >
          <el-select
            v-model="bodyForm.foodTypes"
            placeholder="Please select food type you consume more"
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
      bodyForm: {}, // Initialize as an empty object
      bodyList: [],
      // Left width
      formLabelWidth: "135px",
      // Set default value to invisible
      dialogFormVisible: false,
      title: "",
      total: 0,
      searchModel: {
        pageNo: 1,
        // Default display count
        pageSize: 10,
      },
      // Form validation rules configuration

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
      // Trigger form validation
      this.$refs.bodyFormRef.validate((valid) => {
        // This only comes in when validation fails, define isok outside, set it to false when validation fails
        isOk = valid;
      });

      if (isOk) {
        // Submit validation to backend
        userApi.updateBody(this.bodyForm).then((response) => {
          // Success message
          this.$message({
            message: response.message,
            type: "success",
          });
          // Close dialog
          this.dialogFormVisible = false;
          // Refresh table data
          this.getBodyList();
        });
      } else {
        console.log("error submit!!");
        return false;
      }
    },

    // Clear form data
    clearForm() {
      this.bodyForm = {};
      // Clear form validation messages
      this.$refs.bodyFormRef.clearValidate();
    },
    handleSizeChange(pageSize) {
      // Data update
      this.searchModel.pageSize = pageSize;
      this.getBodyList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getBodyList();
    },

    // Used to query user list
    getBodyList() {
      userApi.getBodyList(this.searchModel).then((response) => {
        console.log(response);

        this.bodyList = response.data.rows;
        // Assign the total property from query results to total
        this.total = response.data.total;
        console.log(this.bodyList);
      });
    },

    openEditUi(id) {
        this.title = "Edit Body Information";
      // Query user data by id
      userApi.getBodyById(id).then((response) => {
        this.bodyForm = response.data;
      });

      this.dialogFormVisible = true;
    },

    deleteBody(body) {
      this.$confirm(`Are you sure you want to delete body information for ${body.name}?`, "Confirm", {
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
        type: "warning",
      })
        .then(() => {
          userApi.deleteBodyById(body.id).then((response) => {
            this.$message({
              type: "success",
              message: response.message,
            });
            this.getBodyList();
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "Deletion cancelled",
          });
        });
    },
  },

  // Query once when loading
  created() {
    this.getBodyList();
    console.log(this.bodyList);
  },
};
</script>
</style scoped>
#search .el-input {
  width: 200px;
  margin-right: 20px;
}
.el-dialog .el-input {
  width: 43%;
}

/* Beautiful CSS styles */
/* body {
    background: linear-gradient(to right, lightblue, lightpink);
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
  } */

/* Beautiful CSS cards */
.el-card {
  width: 80%;
  margin: 20px auto;
  border-radius: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}

/* Beautiful CSS tables */
.el-table {
  width: 100%;
  border-collapse: collapse;
}

/* Beautiful CSS table headers */
.el-table-column {
  background-color: lightblue;
  color: white;
  padding: 10px;
  border: 1px solid white;
  text-align: center;
}

/* Beautiful CSS table data */
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

/* Beautiful CSS table data hover effects */
.el-table-column[type="index"]:hover,
.el-table-column[prop="id"]:hover,
.el-table-column[prop="username"]:hover,
.el-table-column[prop="phone"]:hover,
.el-table-column[prop="email"]:hover {
  background-color: lightpink;
  color: white;
}

/* Beautiful CSS button hover effects */
.el-button:hover {
  transform: scale(1.2);
}

/* CSS similar to this code */
.el-pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 20px;
}

/* CSS total similar to this code */
.el-pagination__total {
  color: #606266;
  margin-right: 20px;
}

/* CSS page size similar to this code */
.el-pagination__sizes {
  display: flex;
  align-items: center;
  margin-right: 20px;
}

/* CSS page size selector similar to this code */
.el-pagination__sizes .el-select {
  width: 100px;
}

/* CSS previous page button similar to this code */
.el-pagination__prev {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* CSS previous page button icon similar to this code */
.el-pagination__prev .el-icon {
  font-size: 20px;
  color: #409eff;
}

/* CSS page numbers similar to this code */
.el-pagination__pager {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* CSS page number buttons similar to this code */
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

/* CSS page number button hover effects similar to this code */
.el-pagination__pager button:hover {
  background-color: #409eff;
  color: white;
}

/* CSS current page number button similar to this code */
.el-pagination__pager button.is-active {
  background-color: #409eff;
  color: white;
}

/* CSS next page button similar to this code */
.el-pagination__next {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* CSS next page button icon similar to this code */
.el-pagination__next .el-icon {
  font-size: 20px;
  color: #409eff;
}

/* CSS jump input box similar to this code */
.el-pagination__jump {
  display: flex;
  align-items: center;
}

/* CSS jump input box label similar to this code */
.el-pagination__jump label {
  color: #606266;
}

/* CSS jump input box input similar to this code */
.el-pagination__jump input {
  width: 50px;
  height: 30px;
  border-radius: 4px;
  border: none;
}
</style>