<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<div class="container">
		
			<div id="links">
				<h2><a href="list">Book Store</a></h2>
				<h2><a href="new">Add New Book</a></h2>
			</div>		
		
			<form name="book_form" action="insert" method="post">
				<caption><h2>New Book Form</h2></caption>
				<p><label>Title:</label>
				<input type="text" name="booktitle" value="" /></p>
				
				<p><label>Author:</label>
				<input type="text" name="bookauthor" value="" /></p>
				
				<p><label>Price:</label>
				<input type="text" name="bookprice" value="" /></p>
				
				<br> <br> 
				<input type="submit" value="Submit">			
			</form>
			
		</div>
			
		
	</body>
</html>