<template>
  <div class="background-view">
    <div class="chat-view">
      <div class="chat-panel">
        <div class="message-panel">
          <!-- Message List -->
          <div class="message-list" ref="messageContainer">
            <div
              v-for="(message, index) in messages"
              :key="index"
              :class="['message-row', message.type]"
            >
              <div v-if="message.type === 'ai'" class="message-avatar">
                <img :src="aiAvatar" alt="AI Avatar" class="avatar" />
              </div>
              <div :class="['message', message.type === 'user' ? 'user-message' : 'ai-message']">
                {{ message.content }}
              </div>
              <div v-if="message.type === 'user'" class="message-avatar">
                <img :src="userAvatar" alt="User Avatar" class="avatar" />
              </div>
            </div>
          </div>

          <!-- Input Area -->
          <div class="message-input">
            <el-input
              v-model="userInput"
              type="textarea"
              :rows="3"
              placeholder="Please type your question here..."
              @keyup.enter.native="sendMessage"
            />
            <el-button type="primary" @click="sendMessage" :loading="loading">
              Send
            </el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AiAssistant',
  data() {
    return {
      messages: [
        {
          type: 'ai',
          content: "Hello! I am your AI health assistant. How can I help you today? (Type 'AI Health Advice' to receive suggestions based on your historical health data!)"
        }
      ],
      userInput: '',
      loading: false,
      socket: null,
      userAvatar: require('@/assets/user.jpg'),
      aiAvatar: require('@/assets/ai.jpg'),
      isConnected: false,
      reconnectAttempts: 0,
      maxReconnectAttempts: 5,
      reconnectInterval: 3000,
      // Get user information from localStorage
      username: localStorage.getItem('username')
    }
  },
  mounted() {
    // Establish WebSocket connection
    this.setupWebSocket()
  },
  beforeDestroy() {
    this.closeWebSocket()
  },
  methods: {
    setupWebSocket() {
      try {
        // Close existing connection
        if (this.socket) {
          this.socket.close()
          this.socket = null
        }

        // Build WebSocket URL
        const wsUrl = `ws://localhost:8080/ws/chat`
        console.log('Connecting to WebSocket server:', wsUrl)
        this.socket = new WebSocket(wsUrl)
        // Connection timeout handling
        const connectionTimeout = setTimeout(() => {
          if (!this.isConnected) {
            console.error('WebSocket connection timeout')
            this.closeWebSocket()
            this.handleReconnect()
          }
        }, 5000)

        // Connection successful
        this.socket.onopen = (event) => {
          clearTimeout(connectionTimeout)
          console.log('WebSocket connection established')
          this.isConnected = true
          this.reconnectAttempts = 0
          this.$message.success('Connected to AI assistant service')
        }

        // Receive messages
        this.socket.onmessage = (event) => {
          try {
            let message = event.data
            if (message.startsWith('data:')) {
              message = message.substring(5)
              // Check end marker
              if (message.includes('[DONE]')) {
                this.loading = false
                console.log('AI response completed')
                return
              }
              // Update last AI message
              const lastMessage = this.messages[this.messages.length - 1]
              if (lastMessage && lastMessage.type === 'ai') {
                lastMessage.content += message
                this.scrollToBottom()
              }
            }
          } catch (error) {
            console.error('Error processing WebSocket message:', error)
            this.$message.error('Message processing error')
          }
        }

        // Error handling
        this.socket.onerror = (error) => {
          console.error('WebSocket error:', error)
          this.isConnected = false
          this.handleReconnect()
        }

        // Connection closed
        this.socket.onclose = (event) => {
          console.log('WebSocket connection closed', event)
          this.isConnected = false
          if (!event.wasClean) {
            this.handleReconnect()
          }
        }
      } catch (error) {
        console.error('WebSocket creation failed:', error)
        this.$message.error(`Connection failed: ${error.message}`)
        this.handleReconnect()
      }
    },
    handleReconnect() {
      if (this.reconnectAttempts >= this.maxReconnectAttempts) {
        this.$message.error('Unable to connect to AI assistant service, please try again later')
        this.isConnected = false
        return
      }

      this.reconnectAttempts++
      const nextAttemptIn = this.reconnectInterval / 1000
      this.$message.warning(`Connection failed, attempting ${this.reconnectAttempts}th reconnection in ${nextAttemptIn} seconds...`)

      setTimeout(() => {
        this.setupWebSocket()
      }, this.reconnectInterval)
    },
    closeWebSocket() {
      if (this.socket) {
        this.socket.close()
        this.socket = null
        this.isConnected = false
      }
    },
    async sendMessage() {
      if (!this.userInput.trim()) return

      // Check connection status
      if (!this.isConnected) {
        this.$message.warning('Connecting to AI assistant service...')
        this.setupWebSocket()
        return
      }

      // Add user message
      this.messages.push({
        type: 'user',
        content: this.userInput
      })
      // Prepare content to send
      const userMessage = this.userInput
      this.userInput = ''

      // Add empty AI message placeholder
      this.messages.push({
        type: 'ai',
        content: ''
      })

      this.loading = true
      this.scrollToBottom()

      try {
        // Build message object, including user information
        const message = {
          type: 'message',
          text: userMessage,
          username: this.username
        }
        // Send message
        if (this.socket.readyState === WebSocket.OPEN) {
          this.socket.send(JSON.stringify(message))
          console.log('Message sent:', message)
        } else {
          throw new Error('WebSocket connection not ready')
        }
      } catch (error) {
        console.error('Failed to send message:', error)
        this.$message.error('Send failed, please retry')
        this.loading = false
        // Remove empty AI message
        this.messages.pop()
        // Try to reconnect
        this.handleReconnect()
      }
    },
    scrollToBottom() {
      this.$nextTick(() => {
        const container = this.$refs.messageContainer
        if (container) {
          container.scrollTop = container.scrollHeight
        }
      })
    }
  }
}
</script>

<style scoped>
.background-view {
  min-height: 100vh;
  background-color: #f5f7fa;
}

.chat-view {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 20px;
}

.chat-panel {
  width: 90%;
  max-width: 800px;
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.message-panel {
  display: flex;
  flex-direction: column;
  height: calc(100vh - 100px);
}

.message-list {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
}

.message-row {
  display: flex;
  align-items: flex-start;
  margin-bottom: 15px;
}

.message-row.user {
  justify-content: flex-end;
}

.message-row.ai {
  justify-content: flex-start;
}

.message-avatar {
  margin: 0 10px;
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
}

.message {
  max-width: 70%;
  padding: 12px 16px;
  border-radius: 12px;
  font-size: 14px;
  line-height: 1.5;
}

.user-message {
  background-color: #409EFF;
  color: white;
}

.ai-message {
  background-color: #f4f4f5;
  color: #333;
}

.message-input {
  padding: 20px;
  border-top: 1px solid #eee;
  display: flex;
  gap: 10px;
}

.message-input .el-textarea {
  flex: 1;
}

.message-input .el-button {
  align-self: flex-end;
}
</style>

