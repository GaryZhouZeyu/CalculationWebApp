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
			var accumulator = ""; //the calculation string
			var paramA = null;
			var paramB = null;
			var operator = null;
			
			var calculation = function(event){
				
				var buttonID = event.target.id;
				$.ajax(
				{
					  url : "CalculateServlet",
					  method:"post",
					  data:{
						  "p1":paramA,
						  "p2":paramB,
						  "operator":operator
					  },
					  success:function(result){
							$("#accumulator").val(result);
							accumulator = result;
							paramA = result;
							operator = null;
							paramB = null;
					  }
				}
				);
				event.preventDefault();
				
			}		
		

			var initializeFunction = function(){
				$("#plus").click(function() {enterOperator('+')});
				$("#minus").click(function() {enterOperator('-')});
				$("#times").click(function() {enterOperator('*')});
				$("#divide").click(function() {enterOperator('/')});
				$("#clear").click(clear);
				$("#calculator #numbers button").click(enterNumber);
				$("#accumulator").click(activateBox);
				$("#equals").click(calculation);
				
			};
			$(document).ready(initializeFunction);
			
			function clear(){
				paramA = "";
				paramB = "";
				operator = null;
				accumulator = "";
				$("#accumulator").val(accumulator);
			}
			
			var activateBox = function(event){				
				
				
			}
			var enterOperator = function(symbol) {
				if(paramA == null){
					alert("You must enter a number first");
				}else if(operator == null){
					accumulator += symbol;
					$("#accumulator").val(accumulator);
					operator = symbol;
				}else{
					alert("Too many operators");
				}
			}
			var enterNumber = function(event){
				var buttonID = event.target.id;
				accumulator += buttonID;
				$("#accumulator").val(accumulator);
				if(operator == null){
					paramA = paramA == null ? buttonID : paramA + buttonID;
				}else{
					paramB = paramB == null ? buttonID : paramB + buttonID;
				}
			}
		
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>calculator</title>
	</head>
	<body>
		<form ID = "calculator">
			<div ID = "numbers">
				<button type = "button" id = "0">0</button>
				<button type = "button" id = "1">1</button>
				<button type = "button" id = "2">2</button>
				<button type = "button" id = "3">3</button>
				<button type = "button" id = "4">4</button>
				<button type = "button" id = "5">5</button>
				<button type = "button" id = "6">6</button>
				<button type = "button" id = "7">7</button>
				<button type = "button" id = "8">8</button>
				<button type = "button" id = "9">9</button>
			</div>
			<div >
				<div ID = "boxA" class = "inputWrapper">
					<input type = "text" id = "accumulator" disabled = true></input>
				</div>
				
				<span>=</span>
				<span ID = "result"></span>
			</div>
			<div ID = "controlPanel">
				<button type = "button" ID = "plus">+</button>
				<button type = "button" ID = "minus">-</button>
				<button type = "button" ID = "times">x</button>
				<button type = "button" ID = "divide">/</button>
				<button type = "button" ID = "equals">=</button>
				<button type = "button" ID = "clear">C</button>
			
			</div>
		</form>
	</body>
</html>