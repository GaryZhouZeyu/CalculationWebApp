<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			#calculator div {
				display:flex
			}
			.inputWrapper{
				padding: 10px;
				padding-left: 75px;	
			}
			.highlight{
				background : yellow;
			}
		</style>
		<script type = "text/javascript" src = "jquery-3.5.1.min.js"></script>
		
		<script type = "text/javascript">	
			var AisActive = true;
			var calculation = function(event){
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
				$("#calculator #numbers button").click(enterNumber);
				$("#boxA").click(activateBox);
				$("#boxB").click(activateBox);
			});
		
			var activateBox = function(event){
				var ID = event.target.id;
				console.log(ID);
				if(ID == "boxA" || ID == "inputA"){
					$("#boxA").addClass("highlight");
					$("#boxB").removeClass("highlight");
					AisActive = true;
				}else{
					$("#boxB").addClass("highlight");
					$("#boxA").removeClass("highlight");
					AisActive = false;
				}
			}
			
			var enterNumber = function(event){
					
			
			}
		
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>calculator</title>
	</head>
	<body>
		<form ID = "calculator">
			<div ID = "numbers">
				<button>0</button>
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
				<button>6</button>
				<button>7</button>
				<button>8</button>
				<button>9</button>
			</div>
			<div >
				<div ID = "boxA" class = "inputWrapper">
					<input type = "number" ID = "inputA"></input>
				</div>
				<div ID = "boxB" class = "inputWrapper">
					<input type = "number" ID = "inputB"></input>
				</div>
				
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