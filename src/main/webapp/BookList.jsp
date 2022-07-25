<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<div class="container">
		<div class="links">
			<h1><a href="list">Book Store</a></h1>
			<h1><a href="new">Add New Book</a></h1>
		</div>
	</div>
	
	<div class="container">
		<table>
			<caption><h2> List of Books</h2></caption>
			<tr>
				<td>Title</td>
				<td>Author</td>
				<td>Price</td>
			</tr>
	
			<c:forEach items="${books_list}" var="item">
				<tr>
					<td>${ item.getTitle() }</td>
					<td>${ item.getAuthor() }</td>
					<td>${ item.getPrice() }</td>
				</tr>
			</c:forEach>		
		</table>
	</div>

	
	</body>
</html>