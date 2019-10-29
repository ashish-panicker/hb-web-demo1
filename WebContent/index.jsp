<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="addstudent.do">
		Name: <input type="text" name="name" /><br>
		Email: <input type="text" name="email"/><br>
		Address: <input type="text" name="address"/><br>
		Phone: <input type="text" name="phone"/><br>
		
		<input type="submit" value="Create"/>
	</form>
	
	<form method="post" action="findstudent.do">
		Id: <input type="text" name="id" /><br>
		<input type="submit" value="Find"/>
	</form>
	
	<c:if test="${created eq true }">
		<h2>The student details was created successfully.</h2>
	</c:if>
	<c:if test="${created eq false }">
		<h2>The student details was not created.</h2>
	</c:if>
	<c:if test="${students ne null }">
	<table>
		<tr>
			<td>Id</td><td>Name</td><td>Email</td><td>Address</td><td>Phone</td><td>Options</td>
			<c:forEach var="s" items="${students }">
			<tr>
				<td>${s.id}</td><td>${s.name}</td>
				<td>${s.email}</td><td>${s.address}</td>
				<td>${s.phoneNo}</td>
				<td> 
					<a href="managestudent.do?id=${s.id}&option=V">View</a> &nbsp; | &nbsp; 
					<a href="managestudent.do?id=${s.id}&option=E">Edit</a> &nbsp; | &nbsp;
					<a href="managestudent.do?id=${s.id}&option=D">Delete</a> 
				</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	</c:if>
	<c:if test="${ex eq true }">
		<p>An error occoured while trying to find the student details.
			Please try again later.
		</p>
	</c:if>
	<c:if test="${npe eq true }">
		<h2>Please make sure the student id is not empty.</h2>
	</c:if>
	<c:if test="${nfe eq true }">
		<h2>Please make sure the student id is a number.</h2>
	</c:if>
	<c:if test="${s ne null }">
		<table>
		<tr>
			<td>Id</td><td>Name</td><td>Email</td><td>Address</td><td>Phone</td>
			</tr>
			<tr>
				<td>${s.id}</td><td>${s.name}</td>
				<td>${s.email}</td><td>${s.address}</td>
				<td>${s.phoneNo}</td>
			</tr>
		</table>
	</c:if>
</body>
</html>