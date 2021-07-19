<!DOCTYPE html>
<html lang="en">
	<head>
  		<title>Login Portal</title>
  		<meta charset="utf-8"/>
  		<meta name="viewport" content="width=device-width, initial-scale=1"/>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	</head>
	<body>
	<div class="jumbotron jumbotron-fluid">
  <div class="container">
	
	<a href="/">
	<button type="button" style="float:right"class="btn btn-outline-info">HOME</button>
	</a>
	<h1 class="display1">Short.ly</h1>
	<h4 class="text-muted display4">Shorten your links here :)</h4>
	<h5>Login</h5>
	</div></div>
		<div class="container">
		<BR/><BR/><BR/>
		
		<form action="/admin" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="email"aria-describedby="emailHelp" placeholder="Enter email" required>
   <!--   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
		<script>
		
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script src="/main.js" type="text/javascript"></script>
	</body>
</html>