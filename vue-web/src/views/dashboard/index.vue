<template>
  <div class="dashboard-container">
    <div class="dashboard-header">
      <h1 class="dashboard-title">Health Dashboard</h1>
      <p class="dashboard-subtitle">Monitor your health metrics and trends</p>
    </div>
    
    <el-row class="row-bg" :gutter="24">
      <el-col :span="6">
        <div class="grid-content modern-card height-card">
          <div class="card-content">
            <div class="card-info">
              <div class="card-label">Height</div>
              <div class="card-value">
                {{ this.bodyInfo.height }}<span class="unit">m</span>
              </div>
            </div>
            <div class="card-icon">
              <i class="el-icon-user-solid"></i>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content modern-card weight-card">
          <div class="card-content">
            <div class="card-info">
              <div class="card-label">Weight</div>
              <div class="card-value">
                {{ this.bodyInfo.weight }}<span class="unit">kg</span>
              </div>
            </div>
            <div class="card-icon">
              <i class="el-icon-odometer"></i>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content modern-card bmi-card">
          <div class="card-content">
            <div class="card-info">
              <div class="card-label">BMI</div>
              <div class="card-value">
                {{ this.bmi }}<span class="unit"></span>
              </div>
            </div>
            <div class="card-icon">
              <i class="el-icon-date"></i>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content modern-card age-card">
          <div class="card-content">
            <div class="card-info">
              <div class="card-label">Age</div>
              <div class="card-value">
                {{ this.bodyInfo.age }}<span class="unit">years</span>
              </div>
            </div>
            <div class="card-icon">
              <i class="el-icon-s-data"></i>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>

    <div class="charts-container">
      <div class="chart-card">
        <div class="chart-header">
          <h3 class="chart-title">Vision Change Trend</h3>
          <p class="chart-subtitle">Track your vision changes over time</p>
        </div>
        <div class="chart-content" ref="myChart"></div>
      </div>
      
      <div class="chart-card">
        <div class="chart-header">
          <h3 class="chart-title">Blood Pressure & Sugar</h3>
          <p class="chart-subtitle">Monitor your vital signs</p>
        </div>
        <div class="chart-content" id="chart-container"></div>
      </div>
      
      <div class="chart-card">
        <div class="chart-header">
          <h3 class="chart-title">Heart Rate Trend</h3>
          <p class="chart-subtitle">Track your heart rate patterns</p>
        </div>
        <div class="chart-content" id="chart-containerLine"></div>
      </div>
    </div>
  </div>
</template>



<script>
import * as echarts from "echarts";

import userApi from "@/api/userManage";
import FunctionApi from "@/api/Function_Menu";
export default {
  data() {
    return {
      charts: "",
      bodyInfo: "",
      bmi: null,
      score: null,
      BodyNotesInfo: "",

      vision: [],
      waterConsumption: [],
      bloodSugar: [],
      bloodPressure: [],
      date: [],
      heartRate: [],
    };
  },
  methods: {
    async getBodyInfo() {
      try {
        // Use destructuring assignment to extract the first element of the data.bodyList array (i.e., bodyInfo object) from the Promise returned by userApi.getBodyInfo()
        const {
          data: {
            bodyList: [bodyInfo],
          },
        } = await userApi.getBodyInfo();
        this.bodyInfo = bodyInfo;
      } catch (error) {
        console.log("Error getting body information");
      }
    },


    async getBodyNotes() {
      try {
        if (!this.bodyInfo || !this.bodyInfo.id) {
          console.log("No body info available");
          return;
        }
  
        const response = await FunctionApi.getBodyNotes(this.bodyInfo.id);

        // Get BodyNotesInfo from the response and assign it to the component's BodyNotesInfo property
        this.BodyNotesInfo = response.data;

        // Clear existing data
        this.vision = [];
        this.waterConsumption = [];
        this.bloodSugar = [];
        this.bloodPressure = [];
        this.heartRate = [];
        this.date = [];

        // Iterate through each element in the BodyNotesInfo array, adding their respective property values to corresponding arrays, note contains the object for each data entry
        this.BodyNotesInfo.forEach((note) => {
          this.vision.push(note.vision);
          this.waterConsumption.push(note.waterConsumption);
          this.bloodSugar.push(note.bloodSugar);
          this.bloodPressure.push(note.bloodPressure);
          this.heartRate.push(note.heartRate);
          const formattedDate = new Date(note.date).toLocaleString("en-US", {
            year: "numeric",
            month: "2-digit",
            day: "2-digit",
          });
          this.date.push(formattedDate);
        });
      } catch (error) {
        console.log("Error getting body information");
      }
    },

    bmiM() {
      // Check if bodyInfo exists and has required properties
      if (!this.bodyInfo || !this.bodyInfo.weight || !this.bodyInfo.height) {
        this.bmi = "N/A";
        return "N/A";
      }
      
      // Get height and weight values from bodyInfo and convert to Number type
      const weight = Number(this.bodyInfo.weight);
      const height = Number(this.bodyInfo.height);
      
      // Check for valid numbers
      if (isNaN(weight) || isNaN(height) || height === 0) {
        this.bmi = "N/A";
        return "N/A";
      }
      
      // Calculate BMI value
      const bmiValue = weight / (height * height);
      // Return calculation result and keep two decimal places
      this.bmi = bmiValue.toFixed(2);
      return bmiValue.toFixed(2);
    },

    BarChart() {
      const chartDom = document.getElementById("chart-container");
      if (!chartDom) {
        console.log("Chart container not found");
        return;
      }
      const myChart = echarts.init(chartDom);

      const option = {
        color: ["#3398DB"],
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "shadow",
          },
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true,
        },
        title: {
          text: "Vision Change Trend Chart",
          textStyle: {
            fontWeight: "normal",
            fontSize: 25,
            color: "#666",
          },
          left: "center",
          top: 20,
          padding: [10, 10, 0, 10],
        },
        xAxis: [
          {
            type: "category",
            data: this.date,
            axisTick: {
              alignWithLabel: true,
            },
            axisLabel: {
              interval: 1, // Set X-axis text display interval
              rotate: 45, // Set X-axis text rotation angle
              textStyle: {
                fontSize: 12, // Set X-axis text style
              },
            },
          },
        ],
        yAxis: [
          {
            type: "value",
            axisLabel: {
              textStyle: {
                fontSize: 12, // Set Y-axis text style
              },
            },
          },
        ],
        series: [
          {
            name: "Vision",
            type: "bar",
            barWidth: "60%",
            data: this.vision,
            itemStyle: {
              // Shadow size
              shadowBlur: 5,
              // Shadow horizontal offset
              shadowOffsetX: 2,
              // Shadow vertical offset
              shadowOffsetY: 2,
              // Shadow color
              shadowColor: "rgba(0, 0, 0, 0.5)",
              // Bar chart rounded corners, initialization effect
              barBorderRadius: 5,
            },
          },
        ],
      };

      myChart.setOption(option);
    },
    area() {
      const chartDom = document.getElementById("chart-containerLine");
      if (!chartDom) {
        console.log("Chart container not found");
        return;
      }
      const myChart = echarts.init(chartDom);

      const option = {
        title: {
          text: "Blood Pressure and Blood Sugar Change Trend Chart",
          textStyle: {
            fontWeight: "normal",
            fontSize: 25,
            color: "#666",
          },
          left: "center",
          top: 20,
          padding: [10, 10, 0, 10],
        },
        tooltip: {
          trigger: "axis",
        },
        legend: {
          data: ["Blood Pressure", "Blood Sugar"],
        },
        xAxis: {
          type: "category",
          data: this.date,
          axisLabel: {
            interval: 1, // Set X-axis text display interval
            textStyle: {
              fontSize: 12, // Set X-axis text style
            },
          },
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            name: "Blood Pressure",
            data: this.bloodPressure,
            type: "line",
          },
          {
            name: "Blood Sugar",
            data: this.bloodSugar,
            type: "line",
          },
        ],
      };

      myChart.setOption(option);
    },
  },

  watch: {
    bodyInfo: {
      deep: true, // Listen for changes in object internal properties
      async handler() {
        this.bmiM(); // Calculate BMI value
        await this.getBodyNotes(); // Get body data information
        this.BarChart();
        this.area();
        const chartDom = this.$refs.myChart;
        const myChart = echarts.init(chartDom);

        const option = {
          title: {
            text: "Heart Rate Change Trend Chart",
            textStyle: {
              fontWeight: "normal",
              fontSize: 25,
              color: "#666",
            },
            left: "center",
            top: 20,
          },
          xAxis: {
            type: "category",
            data: this.date,
            axisLabel: {
              fontSize: 12,
              interval: 2,
            },
            axisTick: {
              show: false,
            },
          },
          yAxis: {
            type: "value",
            axisLine: {
              show: false,
            },
            splitLine: {
              lineStyle: {
                type: "dashed",
                color: "#ddd",
              },
            },
            axisTick: {
              show: false,
            },
          },
          tooltip: {
            trigger: "axis",
            formatter: function (params) {
              return params[0].name + "：" + params[0].value;
            },
          },
          series: [
            {
              data: this.heartRate,
              type: "line",
              smooth: true,
              lineStyle: {
                width: 3,
                color: "#00bfff",
              },
              symbol: "circle",
              symbolSize: 8,
              itemStyle: {
                color: "#00bfff",
                borderColor: "#fff",
                borderWidth: 2,
              },
              markLine: {
                data: [
                  {
                    type: "average",
                    name: "Average",
                  },
                ],
                label: {
                  position: "insideEndBottom",
                  formatter: "{b}：{c}",
                },
                lineStyle: {
                  type: "dashed",
                  color: "green",
                  width: 2,
                },
                symbol: "none",
              },
              animation: true,
              animationDuration: 3000,
              animationEasing: "cubicInOut",
            },
          ],
        };

        myChart.setOption(option);
      },
    },
    
    initCharts() {
      // Initialize all charts
      this.$nextTick(() => {
        if (this.$refs.myChart) {
          this.initVisionChart();
        }
        if (document.getElementById('chart-container')) {
          this.BarChart();
        }
        if (document.getElementById('chart-containerLine')) {
          this.area();
        }
      });
    },
    
    initVisionChart() {
      // Initialize the vision chart (heart rate chart)
      const chartDom = this.$refs.myChart;
      if (!chartDom) return;
      
      const myChart = echarts.init(chartDom);
      const option = {
        title: {
          text: "Heart Rate Change Trend Chart",
          textStyle: {
            fontWeight: "normal",
            fontSize: 25,
            color: "#666",
          },
          left: "center",
          top: 20,
        },
        xAxis: {
          type: "category",
          data: this.date,
          axisLabel: {
            fontSize: 12,
            interval: 2,
          },
          axisTick: {
            show: false,
          },
        },
        yAxis: {
          type: "value",
          axisLine: {
            show: false,
          },
          splitLine: {
            lineStyle: {
              type: "dashed",
              color: "#ddd",
            },
          },
          axisTick: {
            show: false,
          },
        },
        tooltip: {
          trigger: "axis",
          formatter: function (params) {
            return params[0].name + "：" + params[0].value;
          },
        },
        series: [
          {
            data: this.heartRate,
            type: "line",
            smooth: true,
            lineStyle: {
              width: 3,
              color: "#00bfff",
            },
            symbol: "circle",
            symbolSize: 8,
            itemStyle: {
              color: "#00bfff",
              borderColor: "#fff",
              borderWidth: 2,
            },
            markLine: {
              data: [
                {
                  type: "average",
                  name: "Average",
                },
              ],
              label: {
                position: "insideEndBottom",
                formatter: "{b}：{c}",
              },
              lineStyle: {
                type: "dashed",
                color: "green",
                width: 2,
              },
              symbol: "none",
            },
            animation: true,
            animationDuration: 3000,
            animationEasing: "cubicInOut",
          },
        ],
      };
      myChart.setOption(option);
    },
  },

  async created() {
    await this.getBodyInfo();
    await this.getBodyNotes();
    this.bmiM();
  },

  async mounted() {
    // Initialize charts after data is loaded
    this.$nextTick(() => {
      this.initCharts();
    });
  },
};
</script>
<style scoped>
.dashboard-container {
  padding: 24px;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(20px);
  border-radius: 20px;
  margin: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.dashboard-header {
  text-align: center;
  margin-bottom: 40px;
}

.dashboard-title {
  font-size: 2.5rem;
  font-weight: 700;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  /* Fallback for browsers that don't support background-clip: text */
  color: #667eea;
  margin: 0 0 8px 0;
}

.dashboard-subtitle {
  font-size: 1.1rem;
  color: #64748b;
  margin: 0;
  font-weight: 400;
}

.row-bg {
  margin-bottom: 40px;
}

.modern-card {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(20px);
  border-radius: 20px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  overflow: hidden;
  position: relative;
}

.modern-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.modern-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #667eea, #764ba2);
}

.height-card::before { background: linear-gradient(90deg, #4facfe, #00f2fe); }
.weight-card::before { background: linear-gradient(90deg, #43e97b, #38f9d7); }
.bmi-card::before { background: linear-gradient(90deg, #fa709a, #fee140); }
.age-card::before { background: linear-gradient(90deg, #a8edea, #fed6e3); }

.card-content {
  padding: 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  min-height: 120px;
}

.card-info {
  flex: 1;
}

.card-label {
  font-size: 0.875rem;
  font-weight: 600;
  color: #64748b;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: 8px;
}

.card-value {
  font-size: 2rem;
  font-weight: 700;
  color: #1e293b;
  line-height: 1;
}

.unit {
  font-size: 1rem;
  font-weight: 500;
  color: #64748b;
  margin-left: 4px;
}

.card-icon {
  font-size: 3rem;
  opacity: 0.1;
  color: #667eea;
  transition: all 0.3s ease;
}

.modern-card:hover .card-icon {
  opacity: 0.2;
  transform: scale(1.1);
}

.charts-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 24px;
  margin-top: 40px;
}

.chart-card {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(20px);
  border-radius: 20px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: all 0.3s ease;
}

.chart-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.15);
}

.chart-header {
  padding: 24px 24px 16px 24px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.chart-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: #1e293b;
  margin: 0 0 4px 0;
}

.chart-subtitle {
  font-size: 0.875rem;
  color: #64748b;
  margin: 0;
}

.chart-content {
  height: 300px;
  padding: 16px;
  position: relative;
  overflow: hidden;
}
</style>