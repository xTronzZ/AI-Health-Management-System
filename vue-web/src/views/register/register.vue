<template>
  <div class="register-container">
    <div class="register-form">
      <h1>User Registration</h1>
      <el-form :model="form" ref="form" :rules="rules" label-width="80px" class="form">
        <el-form-item label="Username" prop="username">
          <el-input v-model="form.username" placeholder="Please enter username"></el-input>
        </el-form-item>
        <el-form-item label="Password" prop="password">
          <el-input v-model="form.password" type="password" placeholder="Please enter password"></el-input>
        </el-form-item>
        <el-form-item label="Confirm Password" prop="confirmPassword">
          <el-input v-model="form.confirmPassword" type="password" placeholder="Please confirm password"></el-input>
        </el-form-item>
        
        <!-- <el-form-item label="Email" prop="email">
          <el-input v-model="form.email" placeholder="Please enter email"></el-input>
        </el-form-item> -->
        <el-form-item>
          <el-button type="primary" @click="submitForm">Register</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
  <script >
  
  import userApi from "@/api/userManage";
  
  export default {
    data() {
      return {
        form: {
          username: '',
          password: '',
          confirmPassword: '',
          email: ''
        },
        rules: {
          username: [
            { required: true, message: 'Please enter username', trigger: 'blur' }
          ],
          password: [
            { required: true, message: 'Please enter password', trigger: 'blur' },
            { min: 6, message: 'Password must be at least 6 characters', trigger: 'blur' }
          ],
          confirmPassword: [
            { required: true, message: 'Please confirm password', trigger: 'blur' },
            { validator: this.validateConfirmPassword, trigger: 'blur' }
          ],
          // email: [
          //   { required: true, message: 'Please enter email', trigger: 'blur' },
          //   { type: 'email', message: 'Invalid email format', trigger: 'blur' }
          // ],
        }
      }
    },
    methods: {
      submitForm() {
    this.$refs.form.validate(valid => {
      if (valid) {
        // Build request body
        const requestBody = {
          username: this.form.username,
          password: this.form.password,
          email: this.form.email
        };
          // Submit validation to backend
          userApi.register(requestBody).then(response=> {
            // Success message
            this.$message({
              message: response.message,
              type: "success"
            });
            this.$router.push('/login');

          });
      } else {
        return false;
      }
    });
  },
  
  
      validateConfirmPassword(rule, value, callback) {
        if (value !== this.form.password) {
          callback(new Error('Passwords do not match'))
        } else {
          callback()
        }
      }
    }
  }
  </script>
  <style scoped>
  .register-container {
    min-height: 100vh;
    width: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    overflow: hidden;
  }

  .register-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Ccircle cx='30' cy='30' r='2'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    animation: float 20s ease-in-out infinite;
  }

  .register-form {
    position: relative;
    margin: 0 auto;
    max-width: 420px;
    width: 90%;
    padding: 48px 40px;
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
  
  .register-form h1 {
    margin: 0 0 8px 0;
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    /* Fallback for browsers that don't support background-clip: text */
    color: #667eea;
    letter-spacing: -0.02em;
  }

  .register-form p {
    text-align: center;
    color: #64748b;
    margin: 0 0 32px 0;
    font-size: 16px;
  }
  
  .form {
    margin-top: 0;
  }

  .el-form-item {
    margin-bottom: 24px;
  }

  .el-input {
    border-radius: 12px;
    background-color: #f8fafc;
    transition: all 0.3s ease;
  }

  .el-input:hover {
    background-color: #f1f5f9;
  }

  .el-input input {
    padding: 16px 20px;
    font-size: 16px;
    border: none;
    background: transparent;
  }

  .el-button {
    height: 52px;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    color: white;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    width: 100%;
  }

  .el-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
  }

  @keyframes float {
    0%, 100% { transform: translateY(0px); }
    50% { transform: translateY(-20px); }
  }
  </style>
  
  