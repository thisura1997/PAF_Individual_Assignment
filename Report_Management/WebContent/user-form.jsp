<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Laboratory Report Management Application</title>
<script>  
function validate()  
{  
var email=document.myform.email.value; 
var a1=document.myform.a1.value;   
var atposition=email.indexOf("@");  
var dotposition=email.lastIndexOf(".");  

if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){  
  alert("Please enter a valid e-mail address inorder to Proceed \n atposition:"+atposition+"\n dotposition:"+dotposition);  
  }
    
if (isNaN(a1)){  
  document.getElementById("numloc").innerHTML="Enter Numeric value only";  
  return false;  
}else{  
  return true;  
  }  
}  
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
			body {
 background-image: url("bg2.jpg");
 
}
	</style>
</head>
<body>
<body background="bg2.jpg" bgproperties="fixed">
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
		<div>
				<a href="#" class="navbar-brand">Laboratory Report Management Application </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post"name="myform" onsubmit=" validate();" >
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post"name="myform" onsubmit=" validate();" >
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Patient Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name"placeholder="Enter Name of Patient" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Patient Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" placeholder="Email of patient" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Address</label> <input type="text"
						value="<c:out value='${user.a1}' />" class="form-control"
						name="a1" placeholder="Address of patient" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Phone Number</label> <input type="text"
						value="<c:out value='${user.a2}' />" class="form-control"
						name="a2" placeholder="Phone Number of Patient" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Reason</label> <input type="text"
						value="<c:out value='${user.a3}' />" class="form-control"
						name="a3" placeholder="Reason to get the Report" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save Report</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
