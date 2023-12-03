package com.aurionpro.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.jdbc.BankDbUtil;
import com.aurionpro.model.Admin;
import com.aurionpro.model.User;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name="jdbc/bank-source")
	private DataSource dataSource;
	private BankDbUtil dbUtil;
	
	@Override
	public void init() throws ServletException {
		super.init();
		dbUtil = new BankDbUtil(dataSource);
	}
	
	
	
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String user = request.getParameter("username");
		String password = request.getParameter("password");	

		
		String command = request.getParameter("userType");
		if(command == null) {
			command = "login";
		}
		switch(command) {
		case "login":
            response.sendRedirect("login.jsp"); 
			break;
		case "admin":
			Admin admin = new Admin(user, password);

			try {
				if(dbUtil.checkAdmin(admin)) {
					
					HttpSession session = request.getSession();
					session.setAttribute("username", user);
					response.sendRedirect("AdminController"); 
				}
				else {

					response.sendRedirect("login.jsp?error=true");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "user":
			try {
				User tempUser = new User(user, password);
				try {
					if(dbUtil.checkUser(tempUser)) {
						
						if(dbUtil.checkUserStatus(tempUser)) {
							System.out.println("Login Controller check status = ");
							HttpSession session = request.getSession();
							session.setAttribute("username", user);
							response.sendRedirect("UserController"); 
						}
						else {
							response.sendRedirect("login.jsp?error1=true");
						}
						
					}
					else {
						response.sendRedirect("login.jsp?error=true");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			break;
		default:
			response.sendRedirect("login.jsp");
		}

	}


}
