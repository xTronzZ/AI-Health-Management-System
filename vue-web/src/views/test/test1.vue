<template>
  <div class="info-upload">
    <h1 class="title">Body Information Upload</h1>
    <el-form
      :model="form"
      :rules="rules"
      ref="form"
      label-width="100px"
      class="form"
    >
      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="Name" prop="name">
            <el-input
              v-model="form.name"
              :placeholder="'Please enter name'"
            ></el-input>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Age" prop="age">
            <el-input-number v-model="form.age" :min="0"></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="Gender" prop="gender">
            <el-radio-group v-model="form.gender">
              <el-radio label="Male">Male</el-radio>
              <el-radio label="Female">Female</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Height/m" prop="height">
            <el-input-number v-model="form.height" :min="0" :step="0.1"></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="Weight/kg" prop="weight">
            <el-input-number v-model="form.weight" :min="0"></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Blood Sugar" prop="bloodSugar">
            <el-input-number
              v-model="form.bloodSugar"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="Blood Pressure" prop="bloodPressure">
            <el-input-number
              v-model="form.bloodPressure"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Cholesterol" prop="bloodLipid">
            <el-input-number
              v-model="form.bloodLipid"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="Heart Rate/BPM" prop="heartRate">
            <el-input-number
              v-model="form.heartRate"
              :min="0"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Vision/d" prop="vision">
            <el-input-number v-model="form.vision" :min="0" :step="0.1"></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Sleep Duration/h" prop="sleepDuration">
            <el-input-number
              v-model="form.sleepDuration"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Sleep Quality" prop="sleepQuality">
            <el-radio-group v-model="form.sleepQuality">
              <el-radio :label="'Good'">Good</el-radio>
              <el-radio :label="'Average'">Average</el-radio>
              <el-radio :label="'Poor'">Poor</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Smoking" prop="smoking">
            <el-switch v-model="form.smoking"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Drinking" prop="drinking">
            <el-switch v-model="form.drinking"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Exercise" prop="exercise">
            <el-switch v-model="form.exercise"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Preferred Food Types" prop="foodTypes">
            <el-select v-model="form.foodTypes" placeholder="Please select">
              <el-option label="Vegetables" value="Vegetables"></el-option>
              <el-option label="Fruits" value="Fruits"></el-option>
              <el-option label="Meat" value="Meat"></el-option>
              <el-option label="Fish" value="Fish"></el-option>
              <el-option label="Beans" value="Beans"></el-option>
              <el-option label="Grains" value="Grains"></el-option>
            </el-select>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="Water Intake/ml" prop="waterConsumption">
            <el-input-number
              v-model="form.waterConsumption"
              :min="0"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item>
        <el-button type="primary" @click="submitForm()">Upload</el-button>
        <el-button @click="resetForm('form')">Reset</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
  
  <script>
import FunctionApi from "@/api/Function_Menu";
import AvatarUpload from "@/components/HeadImage/AvatarUpload";
import userApi from "@/api/userManage";

export default {
  name: "InfoUpload",
  components: {
    AvatarUpload,
  },
  data() {
    return {
      form: {
        id: null,
        name: "",
        age: null,
        gender: "",
        height: "",
        weight: "",
        bloodSugar: "",
        bloodPressure: "",
        bloodLipid: "",
        heartRate: null,
        vision: null,
        sleepDuration: null,
        sleepQuality: "",
        smoking: null,
        drinking: null,
        exercise: null,
        foodTypes: "",
        waterConsumption: null,
      },

      rules: {
        name: [
          { required: true, message: "Please enter name", trigger: "blur" },
          {
            min: 2,
            max: 10,
            message: "Length should be between 2 and 10 characters",
            trigger: "blur",
          },
        ],
        age: [
          { required: true, message: "Please enter age", trigger: "blur" },
          { type: "number", message: "Age must be a number" },
        ],
        gender: [{ required: true, message: "Please select gender", trigger: "change" }],
        height: [
          { required: true, message: "Please enter height", trigger: "blur" },
          { type: "number", message: "Height must be a number" },
        ],
        weight: [
          { required: true, message: "Please enter weight", trigger: "blur" },
          { type: "number", message: "Weight must be a number" },
        ],
        bloodSugar: [
          { required: true, message: "Please enter blood sugar", trigger: "blur" },
          { type: "number", message: "Blood sugar must be a number" },
        ],
        bloodPressure: [
          { required: true, message: "Please enter blood pressure", trigger: "blur" },
          { type: "number", message: "Blood pressure must be a number" },
        ],
        bloodLipid: [
          { required: true, message: "Please enter blood lipid", trigger: "blur" },
          { type: "number", message: "Blood lipid must be a number" },
        ],

        heartRate: [
          { required: true, message: "Please enter heart rate", trigger: "blur" },
          { type: "number", message: "Heart rate must be a number" },
        ],
        vision: [
          { required: true, message: "Please enter vision", trigger: "blur" },
          { type: "number", message: "Vision must be a number" },
        ],
        sleepQuality: [
          {
            required: true,
            message: "Please select sleep quality",
            trigger: "change",
          },
        ],
        smoking: [
          { required: true, message: "Please select smoking", trigger: "change" },
        ],
        drinking: [
          { required: true, message: "Please select drinking", trigger: "change" },
        ],
        exercise: [
          { required: true, message: "Please select exercise", trigger: "change" },
        ],
        foodTypes: [
          { required: true, message: "Please select the food type you consume more", trigger: "blur" },
        ],
        waterConsumption: [
          { required: true, message: "Please enter water intake", trigger: "blur" },
          { type: "number", message: "Water intake must be a number" },
        ],
      },
    };
  },

  methods: {
  submitForm() {
  // If there is no id attribute in the form data, assign the component's id attribute to the form data's id attribute
  if (!this.form.id) {
    this.form.id = this.id;
  }

  this.$refs.form.validate((valid) => {
    if (valid) {
      FunctionApi.BodyInformation(this.form)
        .then((response) => {
          this.$message({
            type: "success",
            message: response.message,
          });
        })
        .catch((error) => {
        });
        
      FunctionApi.BodyInformationNotes(this.form)
        .then((response) => {

        })
        .catch((error) => {
        });
    } else {
      return false;
    }
  });
},


  // Method to reset form data
  resetForm(formName) {
    this.$refs[formName].resetFields();
    console.log(this.id);
    this.$message({
      message: "Form has been reset",
      type: "info",
    });
  },


  async getUserId() {
    await userApi.getUserId().then((response) => {
      // If the request is successful and the returned data contains an id attribute, convert it to an integer and assign it to the component's id attribute
      if (response && response.data) {
        this.id = parseInt(response.data.id);
      }
    });
  },
},

  created() {
    this.getUserId();
  },
};
</script>
  
<style scoped>
.info-upload {
  max-width: 800px;
  margin: 0 auto;
  padding: 50px;
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
}

.title {
  font-size: 36px;
  text-align: center;
  color: #555;
}

.form {
  max-width: 600px;
  margin: 0 auto;
}

</style>

  