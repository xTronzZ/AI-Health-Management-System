<!-- Search box and add button, search box, and input fields for username and phone number -->
<template>
  <div>
    <el-card id="search">
      <el-row>
        <el-col :span="23">
          <!-- v-model binding component implements two-way data binding, user input values on the page will be synchronized to this property -->
          <el-input
            v-model="searchModel.sportType"
            placeholder="Sport Type"
            clearable
          ></el-input>
          <el-button
            @click="getSportList"
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
      <el-table :data="sportList" stripe style="width: 100%">
        <el-table-column
          type="index"
          label="No."
          width="180"
        ></el-table-column>
        <el-table-column prop="id" label="ID" width="150"></el-table-column>
        <el-table-column
          prop="sportType"
          label="Sport Type"
          width="150"
        ></el-table-column>
        <el-table-column
          prop="suitableFrequency"
          label="Exercise Frequency"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="suitableTime"
          label="Exercise Time"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="recommendedSpeed"
          label="Exercise Speed"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="suitableHeartRate"
          label="Exercise Heart Rate"
          width="150"
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
              @click="deleteSport(scope.row)"
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

    <!-- Sport Edit Dialog -->
    <el-dialog
      @close="clearForm"
      :title="title"
      :visible.sync="dialogFormVisible"
    >
      <el-form :model="sportForm" ref="sportFormRef" >
        <el-form-item label="Sport Type" prop="sportType" :label-width="formLabelWidth">
          <el-input v-model="sportForm.sportType" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
           label="Exercise Frequency" prop="suitableFrequency" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableFrequency" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="Exercise Time" prop="suitableTime" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableTime" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="Exercise Speed" prop="emrecommendedSpeedail" :label-width="formLabelWidth">
          <el-input v-model="sportForm.recommendedSpeed" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="Exercise Heart Rate" prop="suitableHeartRate" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableHeartRate" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="saveSport">Confirm</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import sportApi from "@/api/Function_Menu";
export default {
  data() {
  
    return {
      sportForm: {}, //Initialize as an empty object
      sportList:[],
      //Left width
      formLabelWidth: "135px",
      //Set default value to invisible
      dialogFormVisible: false,
      title: "",
      total: 0,
      searchModel: {
        pageNo: 1,
        // Default display count
        pageSize: 10,
      },
      //Form validation rules configuration

      rules: {
        sportType: [
          { required: true, message: "Please enter sport type", trigger: "blur" }
        ]
      },
    };
  },

  methods: {
    saveSport() {
      let isOk = true;
      //Trigger form validation
      this.$refs.sportFormRef.validate((valid) => {
        // This only comes in when validation fails, define isOk outside, set it to false when validation fails
        isOk = valid;
      });

      if (isOk) {
        //Submit validation to backend
        console.log(this.sportForm)
        sportApi.saveSport(this.sportForm).then((response) => {
          //Success message
          this.$message({
            message: response.message,
            type: "success",
          });
          //Close dialog
          this.dialogFormVisible = false;
          //Refresh table data
          this.getSportList();
        });
      } else {
        console.log("error submit!!");
        return false;
      }
    },

    //Clear form data
    clearForm() {
      this.sportForm = {
      };
      //Clear form validation messages
      this.$refs.sportFormRef.clearValidate();
    },
    handleSizeChange(pageSize) {
      //Data update
      this.searchModel.pageSize = pageSize;
      this.getSportList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getSportList();
    },




    getSportList() {
      sportApi.getSportList(this.searchModel).then((response) => {
        console.log(response)
        // Assign the rows property from query results to sportList
        this.sportList = response.data.rows;
        // Assign the total property from query results to total
        this.total = response.data.total;
        console.log(this.sportList)
      });
    },



    openEditUi(id) {
      console.log(id)
      if (id == null) {
        this.title = "Add Sport Information";
      } else {
        this.title = "Edit Sport Information";
        //Query user data by id
        sportApi.getSportById(id).then((response) => {
          this.sportForm = response.data;
          console.log(this.sportForm)
        });
      }
      this.dialogFormVisible = true;
    },


    deleteSport(sport) {
      this.$confirm(`Are you sure you want to delete sport information for ${sport.sportType}?`, "Confirm", {
        confirmButtonText: "Confirm",
        cancelButtonText: "Cancel",
        type: "warning",
      })
        .then(() => {
          sportApi.deleteSportById(sport.id).then((response) => {
            this.$message({
              type: "success",
              message: response.message,
            });
            this.getSportList();
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

  
  //Query once when loading
  created() {
    this.getSportList();
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