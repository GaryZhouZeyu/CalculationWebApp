<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			#calculator div {
				display:flex
			}
		</style>
		<script type = "text/javascript" src = "jquery-3.5.1.min.js"></script>
		
		<script type = "text/javascript">	
			calculation = function(event){
				var inputA = $("#inputA").val();
				var inputB = $("#inputB").val();
				var buttonID = event.target.id;
				$.ajax(
				{
					  url : "CalculateServlet",
					  method:"post",
					  data:{
						  "p1":inputA,
						  "p2":inputB,
						  "operator":buttonID
						  
					  },
					  success:function(result){
							$("#result").html(result);
					  }
				}
				);
				event.preventDefault();
				
			}		
		
			$(document).ready(function(){
				$("#plus").click(calculation);
				$("#minus").click(calculation);
				$("#times").click(calculation);
				$("#divide").click(calculation);
			});
		
		
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>calculator</title>
	</head>
	<body>
		<form ID = "calculator">
			<div >
				<input type = "number" ID = "inputA"></input>
				<input type = "number" ID = "inputB"></input>
				<span>=</span>
				<span ID = "result"></span>
			</div>
			<div ID = "controlPanel">
				<button type = "button" ID = "plus">+</button>
				<button type = "button" ID = "minus">-</button>
				<button type = "button" ID = "times">x</button>
				<button type = "button" ID = "divide">/</button>
			
			
			</div>
		</form>
	</body>
</html>