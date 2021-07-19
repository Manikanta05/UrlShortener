<!DOCTYPE html>
<html lang="en">
	<head>
  		<title>Short.ly</title>
  		<meta charset="utf-8"/>
  		<meta name="viewport" content="width=device-width, initial-scale=1"/>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	</head>
	<body>
	<div class="jumbotron jumbotron-fluid">
  <div class="container">
	
	<a href="/adminLogin">
	<button type="button" style="float:right"class="btn btn-outline-secondary">Admin Login</button>
	</a>
	<h1 class="display1">Short.ly</h1>
	<h4 class="text-muted display4">Shorten your links here :)</h4>
	</div></div>
		<div class="container">
		<BR/><BR/><BR/>
	  		<div class="card">
	  		 <div class="card-header">Enter <b>"Full URL"</b> and click 
	  		 <span class="badge badge-primary">button</span>
	  		  to get <b>"Short URL"</b> </div>
	  		 <div class="card-body">
	  		<form>
    		<div class="form-group">
      			<label for="urlinput">Full URL:</label>
      			<input type="text" id="urlinput" class="form-control" name="urlinput" maxlength="255" required/> 
    		</div>
    		<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">Short URL:</span>
  </div>
  <input type="text" class="form-control" placeholder="Short URL appears here ..." id="shorturltext" name="shorturltext" aria-label="surl" aria-describedby="basic-addon1" disabled>
</div>
    	  	<!--  
    	  	<div class="form-group">
      			<label for="shorturltext">Short URL:</label>
      			<input type="text" id="shorturltext" class="form-control" name="shorturltext" maxlength="255" disabled />
    		</div>
    		-->
    		<button type="button" onclick="myfunction()" id="button" name="button"class="btn btn-primary">Click here to get Short URL</button>
    		</form>
    		</div>
    		</div>
		</div>
		<script>
		function myfunction(){
			
		//alert("abcd");
		$(document).ready(function() {
			$("button").click(function() {
				$.ajax({
					type : 'POST',
					url : 'http://localhost:8086/shortenurl',
					data : JSON.stringify({
						"full_url" : $("#urlinput").val()
					}),
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						$("#shorturltext").val(data.short_url);
					}
				});
			});
		});
		}
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script src="/main.js" type="text/javascript"></script>
	</body>
</html>