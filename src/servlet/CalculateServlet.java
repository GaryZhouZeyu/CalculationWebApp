package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import service.CalculateService;

/**
 * Servlet implementation class CalculateServlet
 */
@WebServlet("/CalculateServlet")
public class CalculateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * Default constructor. 
     */
    public CalculateServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		String param1 = request.getParameter("p1");
		String param2 = request.getParameter("p2");
		String operator = request.getParameter("operator");
		if(operator.equals("plus")) {
			double sum = CalculateService.sum(param1, param2, user);
			String sumStr = String.valueOf(sum);		
			response.getWriter().append(sumStr);
		}else if(operator.equals("minus")) {
			double difference = CalculateService.difference(param1, param2);
			String diffStr = String.valueOf(difference);		
			response.getWriter().append(diffStr);
		}else if(operator.equals("times")) {
			double product = CalculateService.product(param1, param2);
			String prodStr = String.valueOf(product);		
			response.getWriter().append(prodStr);
		}else if(operator.equals("divide")) {
			double dividend = CalculateService.dividend(param1, param2);
			String divStr = String.valueOf(dividend);		
			response.getWriter().append(divStr);
		}else {
			System.out.print("wrong parameter");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		if(user == null) {
			String destination = "Login.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
			requestDispatcher.forward(request, response);
		}else {
			String destination = "Calculate.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
			requestDispatcher.forward(request, response);
		}
		
	}

}
