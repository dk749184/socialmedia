<%@ page import="dao.UserDAO"%>
<header>
<style>
/* === Base Styling === */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body.bg-dark {
  background-color: #121212;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #ffffff;
  line-height: 1.6;
}

a {
  text-decoration: none;
  color: inherit;
}

/* === Header Styling === */
.header {
  background-color: #1e1e1e;
  padding: 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid #333;
  flex-wrap: wrap;
}

.aup {
  font-size: 2rem;
  font-weight: bold;
  color: #ffffff;
}

.menubar {
  display: flex;
  gap: 20px;
  flex-grow: 1;
  justify-content: center;
}

.menu {
  color: #113CEC;
  padding: 10px 15px;
  font-weight: 500;
  transition: color 0.3s;
}

.menu:hover {
  color: #0d2ba3;
}

/* === User Profile Section in Header === */
.user-profile {
  text-align: center;
  min-width: 120px;
}

.avatar {
  border-radius: 100%;
  height: 60px;
  width: 60px;
  object-fit: cover;
  margin-bottom: 5px;
}

.user-name {
  font-size: 1rem;
  color: #ffffff;
  margin: 5px 0;
}

.logout-btn {
  display: inline-block;
  margin-top: 5px;
  padding: 6px 12px;
  color: #007bff;
  border: 1px solid #007bff;
  border-radius: 4px;
  transition: 0.3s;
  font-size: 0.9rem;
}

.logout-btn:hover {
  background-color: #007bff;
  color: #fff;
}

/* === Main Layout === */
main {
  padding: 20px;
}

.my-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

/* === Form Styling === */
form {
  background-color: #1f1f1f;
  padding: 20px;
  border-radius: 10px;
}

label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
  color: #ffffff;
}

textarea.form-control {
  width: 100%;
  border: 1px solid #333;
  background-color: #2a2a2a;
  color: #ffffff;
  border-radius: 6px;
  padding: 10px;
  resize: vertical;
}

button.btn {
  margin-top: 10px;
  padding: 10px 20px;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}

button.btn-primary {
  background-color: #007bff;
  color: #ffffff;
}

button.btn-primary:hover {
  background-color: #0056b3;
}

/* === Post Cards === */
.card {
  background-color: #1f1f1f;
  border-radius: 10px;
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid #333;
}

.card .card-title {
  font-size: 1.2rem;
  font-weight: bold;
  color: #ffffff;
}

.card .card-subtitle {
  font-size: 1rem;
  color: #cccccc;
  margin-bottom: 5px;
}

.card .card-text {
  font-size: 0.9rem;
  color: #aaaaaa;
}

/* === Grid Layout (Responsive) === */
.row {
  display: flex;
  flex-wrap: wrap;
  margin: -10px;
}

.col-md-4,
.col-md-8,
.col-sm-12 {
  padding: 10px;
  box-sizing: border-box;
}

.col-md-4 {
  flex: 0 0 33.3333%;
}

.col-md-8 {
  flex: 0 0 66.6666%;
}

.col-sm-12 {
  flex: 0 0 100%;
}

/* === Responsive Adjustments === */
@media (max-width: 768px) {
  .col-md-4,
  .col-md-8 {
    flex: 0 0 100%;
  }

  .menubar {
    justify-content: center;
    flex-wrap: wrap;
  }

  .header {
    flex-direction: column;
    align-items: flex-start;
  }

  .user-profile {
    align-self: center;
    margin-top: 10px;
  }
}
</style>
	<div class="header" style=" " >
		<h1 class="aup">AUP</h1>
		<nav class="menubar" style="text-align : right;
	color : #113CEC;
	text-align : right;
	" >
			<a style="font-color : #113CEC; margin : 20;padding : 10;" class="menu"  href="${pageContext.request.contextPath}/home">Home</a> 
			<a class="menu" href="${pageContext.request.contextPath}/profile">Profile</a>
			<a class="menu" href="${pageContext.request.contextPath}/message">Message</a> 
		</nav>
		<div style="width: 110px; text-align: center;">
			<img style="border-radius: 100%; height: 60px; width: 60px;"
				src="https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg?cs=srgb&dl=animal-close-up-little-1661179.jpg&fm=jpg" />
		</div>
		<div>
			<div class="row">
				<p style="text-align: center; width: 100%; margin-bottom: 2px;"><%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %></p>
				<a style="width: 100%; margin: 20 ; text-align: left;" class="btn btn-outline-primary"
					href="${pageContext.request.contextPath}/logout">logout</a>
			</div>
		</div>

	</div>
</header>