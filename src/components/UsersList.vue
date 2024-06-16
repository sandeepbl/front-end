<template>
    <div class="container" v-if="userAuthenticated">
        <h1>Users</h1>
        <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">Username</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Role</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="user in $store.state.users" :key="user.id">
            <td>{{ user.username }}</td>
            <td>{{ user.first_name }}</td>
            <td>{{ user.last_name }}</td>
            <td>{{ user.role }}</td>
            <td>
                <button type="button" class="btn btn-primary">Edit</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </td>
        </tr>
        </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data () {
        return {
            alertLevel: '',
            userAuthenticated: false,
            userLoggedIn: true
        }
    },
    mounted() {

        axios.get('/healthcheck/').then(
                (response) => {
                    console.log('Backend: '+response.data.message)
                }
            ).catch(error => {
                console.error("Healthcheck Failed... Backend server not responding.")
                })
        
        axios({method: 'get', url:'/access/', headers: { 'Authorization': 'Bearer ' + localStorage.access_token}}).then(
            (response) => {
                console.log('User has access. Backend Response: '+response.data.message)
                this.userAuthenticated = true
            }
            ).catch(error => {
                console.error("User login check failed...")
                this.userAuthenticated = false
            })
        console.log('userLoggedIn: ' + this.userAuthenticated)

        axios({method: 'get', url:'/users/', headers: { 'Authorization': 'Bearer ' + localStorage.access_token}}).then(
            (response) => {
                console.log("Receiving Users")
                this.$store.state.users = response.data.users
                this.userAuthenticated = true
            }
            ).catch(error => {
                console.log('failed to get users. ' + error)
                
            })
       
        }  
    }
</script>

<style>

</style>