<template>
  <div class="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="/">TMS</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link" href="/tasks">Tasks</a>
          <a class="nav-link" href="/projects">Projects</a>
          <li class="nav-item dropdown" justify-content-end>
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Users {{ currentUser.username }}
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/users">Manage Users</a></li>
              <li><a class="dropdown-item" href="/register">Register New User</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="/login">{{ userLoginText }}</a></li>
            </ul>
          </li>
        </div>
      </div>
    </div>
  </nav>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data () {
    return {
      userLoginText: "Login User",
      currentUser: {
        username: '',
        firstName: '',
        firstName: '',
        firstName: '',
        lastName: '',
        role: ''
      }
    }
  },
  mounted() {
    if (localStorage.username) {
      this.currentUser.firstName = localStorage.first_name
      this.currentUser.lastName = localStorage.last_name
      this.currentUser.username = localStorage.username
      this.currentUser.role = localStorage.role
      this.userLoginText = 'Logged in as: ' +  localStorage.first_name + ' ' + localStorage.last_name + ' (' + localStorage.role + ') '
    }
  }
}
</script>



