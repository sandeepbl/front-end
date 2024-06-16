import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './axios/axios.js'
import { createStore } from 'vuex'

const store = createStore({
    state() {
        return {
            users: [],
            tasks: [],
            projects: []
        }
    }
})
const app = createApp(App);
app.use(store);
app.use(router);
app.mount('#app');
