package com.aurionpro.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.aurionpro.jdbc.BankDbUtil;
import com.aurionpro.model.Transaction;
import com.aurionpro.model.User;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/bank-source")
	private DataSource dataSource;
	private BankDbUtil dbUtil;
	List<Transaction> transaction = new ArrayList<>();
	
	@Override
	public void init() throws ServletException {
		super.init();
		dbUtil = new BankDbUtil(dataSource);
		System.out.println("inside admin serv");
	}
    public AdminController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String command= request.getParameter("action");
		System.out.println("Admin Action = "+command);
		if(command == null) {
			command = "admin";
		}
		switch(command) {
		case "admin":
			try {
				adminHome(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "createUser":
			try {
				createUser(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "viewlog":
			try {
				
				System.out.println("Inside view log switch");
				allTransaction(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "userStatus":
			try {
				userStatus(request,response);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		default:
			try {
				adminHome(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void userStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		String userStatus = request.getParameter("userStatusToggle");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(userStatus+ " "+id);
		
		if (userStatus == null) {
	        dbUtil.setUserStatus(true, id);
	    }
		else{
	        dbUtil.setUserStatus(false, id);
	    } 
		
		response.sendRedirect(request.getContextPath()+"/AdminController");
		
	}
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		dbUtil.deleteUserById(id);
		response.sendRedirect(request.getContextPath()+"/AdminController");
		
	}
	private void adminHome(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

		String searchInput = request.getParameter("searchInput");
		String searchBasedOn = request.getParameter("searchBasedOn");

	    List<User> userList = null;
	    if (searchInput != null && searchBasedOn != null) {
	    	userList = dbUtil.searchUsers(searchInput, searchBasedOn);
	    } else {
	    	userList = dbUtil.getAllUser();
	    }
	    
		request.setAttribute("userData", userList);
		RequestDispatcher dispatcher= request.getRequestDispatcher("/admin-home.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	private void allTransaction(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		double balance = Double.parseDouble((request.getParameter("balance")));
		
		
		request.setAttribute("id", id);
		request.setAttribute("username", username);
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("balance", balance);

		transaction = dbUtil.getTransactionById(id);
		System.out.println("++++++++++++++++++++++++++"+transaction);
//		response.sendRedirect(request.getContextPath()+"/user-transaction.jsp");
		request.setAttribute("userTransaction", transaction);
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("/list-transactions.jsp");
		dispatcher.forward(request, response);
//
	}
	private void createUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int balance = Integer.parseInt(request.getParameter("balance"));
		
		if(!dbUtil.isUsernameExist(username)) {
			User tempUser = new User(firstName,lastName,username,password,balance);
			System.out.println(tempUser);
			dbUtil.addNewUser(tempUser);
			response.sendRedirect(request.getContextPath()+"/AdminController");
		}
		else {
			System.out.println("User alredy exist");
		}
	}
	


}
