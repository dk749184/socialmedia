<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Post"%>
<%@ page import="dao.UserDAO"%>
<%
	if (session == null || session.getAttribute("user_id") == null) {
		response.sendRedirect("login");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home | Social</title>
<link rel="shortcut icon" href="image/logo.png">
<link rel="stylesheet" href="C:\Users\dkyad\eclipse-workspace\SocialMediaProject\src\main\webapp\WEB-INF\style.css"/>
<style>
/* General Body Styling */
body.bg-dark {
  background-color: #121212;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #ffffff;
  margin: 0;
  padding: 0;
}

/* Container Styling */
.my-container {
  padding: 40px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

/* Form Styling */
form {
  background-color: #1e1e1e;
  padding: 20px;
  border-radius: 10px;
}

label {
  font-weight: bold;
  margin-bottom: 10px;
  display: inline-block;
  color: #ffffff;
}

textarea.form-control {
  width: 100%;
  border: none;
  border-radius: 6px;
  padding: 10px;
  resize: vertical;
  background-color: #2a2a2a;
  color: #ffffff;
}

button.btn {
  margin-top: 10px;
}

button.btn-primary {
  background-color: #007bff;
  border: none;
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  transition: background-color 0.3s;
}

button.btn-primary:hover {
  background-color: #0056b3;
}

/* Card Styling */
.card {
  background-color: #1f1f1f;
  border: 1px solid #333;
  border-radius: 10px;
  padding: 15px;
  color: #ffffff;
}

.card .card-title {
  font-size: 1.2rem;
  font-weight: 600;
  margin-bottom: 5px;
}

.card .card-subtitle {
  font-size: 1rem;
  color: #cccccc;
  margin-bottom: 10px;
}

.card .card-text {
  font-size: 0.9rem;
  color: #aaaaaa;
}

/* User Avatar */
img {
  width: 100%;
  height: auto;
  border-radius: 0%;
  object-fit: cover;
}

/* Row and Column Responsive Styling */
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

@media (max-width: 768px) {
  .col-md-4,
  .col-md-8 {
    flex: 0 0 100%;
  }
}

</style>

</head>
<body class="bg-dark">

	<%@include file="header.jsp" %>

	<main role="main">
		<div class="my-container">
			<div class="row">
			<div class="col-md-4 col-sm-12">
				<div style="padding: 20px;">
					<form action="home" method="post">
					  <div class="form-group">
					   <!-- Textarea for post -->
							<label for="post" style="color: #ffffff">Create Post</label>
							<textarea name="post" class="form-control" id="post" rows="3"></textarea>
						   <label for="imageUrl">Image URL (optional)</label>
	    					<input type="text" name="imageUrl" class="form-control" id="imageUrl" placeholder="https://example.com/image.jpg" />
					  	
					  </div>
					  
					  <button type="submit" class="btn btn-primary">Post</button>
					</form>
				</div>
			</div>
			<div class="col-md-8 col-sm-12">
				<div style="padding: 20px;">
				
					<%
						ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
						
						if(posts.size() == 0){
							%><h4 style="text-align: center; color: #ffffff;">No Posts.</h4><%
						}
						
						for(int i=0; i<posts.size(); i++){
							%>
							
							<div class="card mb-3">
							  <div class="card-body">
							  	<div class="row">
							  		<div class="col-2">
								  		<img style="width: 100%; border-radius: 100%;" src=" " />
								  	</div>
								  	<div class="col-10">
									  	<h5 class="card-title">
									  		<%
									  			if(posts.get(i).getUser_id() == (int) session.getAttribute("user_id")){
									  				%><h5 class="card-title"><%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %> </h5><%
									  			} else{
									  				%>
									  				<h5 class="card-title"> <%= new UserDAO().getUserById(posts.get(i).getUser_id()).getFirst_name() %> </h5>
									  				<%
									  			}
									  				
									  		%>
									  	</h5>
									    <h6 class="card-subtitle mb-2 text-muted"><%= posts.get(i).getBody() %></h6>
									    <p class="card-text"><%= posts.get(i).getPost_time() %></p>
								  	</div>
								 </div>
								</div>
							</div>
					
							<%
						}
					%>

				</div>
			</div>
			</div>
		</div>
	</main>
	
	
	<script>
            CKEDITOR.replace('post');
    </script>
</body>
</html>