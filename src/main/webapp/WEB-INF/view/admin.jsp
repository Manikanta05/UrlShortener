<!DOCTYPE html>
<html lang="en">
	<head>
	
  		<title>Admin Portal</title>
  		<meta charset="utf-8"/>
  		<meta name="viewport" content="width=device-width, initial-scale=1"/>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	</head>
	<body>
	<div class="jumbotron jumbotron-fluid">
  <div class="container">
	
	<a href="/">
	<button type="button" style="float:right"class="btn btn-outline-danger">Logout</button>
	</a>
	<h1 class="display1">Short.ly</h1>
	<h4 class="text-muted display4">Shorten your links here :)</h4>
	<h5>Admin</h5>
	<a href="/">Home</a>
	</div></div>
		<div class="container">
		<BR/><BR/><BR/>
		
		
		
	  	 <div class="table responsive mt-5 ml-5">
    <table >
			<thead>
			<th>Full Url</th>
			<th>Short Url</th>
			<th>Code</th>
			<th>Delete</th>
			</thead>
			<!-- List<Login> listUsers = (List) request.getAttribute("listUsers");
							String updateURL;
							for (int i = 0; i < listUsers.size(); i++) {
								out.print("<tr>");
								out.print("<td>" + listUsers.get(i).getUsers_id() + "</td>");
								out.print("<td>" + listUsers.get(i).getUsername() + "</td>");
								out.print("<td>" + listUsers.get(i).getEmail() + "</td>");
								updateURL = request.getContextPath() + "/operation?page=updateUser" + "&usersId="
										+ listUsers.get(i).getUsers_id() + "&username=" + listUsers.get(i).getUsername() + "&email="
										+ listUsers.get(i).getEmail();
								deleteURL = request.getContextPath() + "/operation?page=deleteUser" + "&usersId="
										+ listUsers.get(i).getUsers_id();
								out.print("<td><a href=" + updateURL + ">Update</a>|");
				%>
				<a href="%=deleteURL%"
					onclick="if(!confirm('Are you sure to delete the user?')) return false">Delete</a>
				</td>
				out.print(listUsers.size()); -->
				<%@ page import="java.util.List" %>
				<%@ page import="com.example.demo.*" %>
			<% 
			List<ShortenUrl> listUsers = (List)request.getAttribute("urls");
			String deleteURL;
			
			if(listUsers!=null){
			for(ShortenUrl i:listUsers){
				
				out.print("<tr>");
				out.print("<td>"+i.getFull_url()+"</td>");
				out.print("<td>"+i.getShort_url()+"</td>");
				out.print("<td>"+i.getRandChar()+"</td>");
				
				deleteURL = request.getContextPath() + "/deleteUrl/"+i.getRandChar()
				//+ "&usersId="
						//+ listUsers.get(i).getUsers_id()
			;
				out.print("<td><a href="+deleteURL+" onclick='if(!confirm('Are you sure to delete the user?')) return false'>Delete</a></td>");
				 
				/* updateURL = request.getContextPath() + "/operation?page=updateReq" + 
				"&name="+ i.getName() + "&email=" + i.getEmail() + "&type=user&rtype="
								+ i.getRtype() + 
								"&ogname="+ name + "&ogemail=" + email+"&status=" + i.getStatus();
				
				out.print("<td><a href=" + updateURL + ">Accept</a></td>");*/
				out.print("</tr>");
			}
			}
			%>
			</table>
    </div>
	  	
		<script>
		
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script src="/main.js" type="text/javascript"></script>
	</body>
</html>