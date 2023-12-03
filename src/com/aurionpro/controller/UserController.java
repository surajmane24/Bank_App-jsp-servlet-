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
//import com.aurionpro.jdbc.UserDbUtil;
import com.aurionpro.model.Transaction;
import com.aurionpro.model.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {

	@Resource(name = "jdbc/bank-source")
	private DataSource dataSource;

	private BankDbUtil dbUtil;

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	    super.init();
	    dbUtil = new BankDbUtil(dataSource);
	    getServletContext().setAttribute("userController", this);
	}


	public UserController() {
		super();
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Looking for action: "+action);
        if (action == null) {
            action = "user";
        }

        switch (action) {
            case "user":
            	try {
    				userHome(request, response);
    			} catch (SQLException e1) {
    				e1.printStackTrace();
    			}	
             	break;
            case "passbook":
            	try {
            		getPassbook(request,response);
    			} catch (SQLException e1) {
    				e1.printStackTrace();
    			}
    			break;
    		case "updateUser":
				try {
					updateUser(request,response);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
    		case "load_update":
    			try {
    				loadUser(request, response);
    			} catch (Exception e1) {
    				e1.printStackTrace();
    			}
    			break;
    		case "makeTransaction":
			try {
				makeTransaction(request,response);
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
    			break;
    		case "depositMoney":
				try {
					System.out.println("deposit switch=======");
					depositMoney(request,response);
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
    			break;
    		case "withdrawMoney":
				try {
					withdrawMoney(request,response);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
    			break;
    		case "transferMoney":
				try {
					transferMoney(request,response);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
    			break;
            default:
				try {
					userHome(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}

        }
    }
    
    private void depositMoney(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	int id =Integer.parseInt(request.getParameter("id"));
    	double balance = Double.parseDouble(request.getParameter("balance"));
    	System.out.println("balance ======= "+ balance);
		double depositAmount = Double.parseDouble(request.getParameter("depositAmount"));
		System.out.println("Deposit Amount ===="+ depositAmount);
		
		
		 boolean isMoneyCredited =dbUtil.depositMoney(id,balance,depositAmount);
		 
		 response.sendRedirect(request.getContextPath()+"/success.jsp");
	}


	private void withdrawMoney(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
    	double balance = Double.parseDouble(request.getParameter("balance"));
		double withdrawAmount = Double.parseDouble(request.getParameter("withdrawAmount"));
		boolean invalidAmount = false;
		if(withdrawAmount > balance) {
			invalidAmount = true;
			request.setAttribute("invalidAmount", true);
		}
		else {
			boolean showSpinner=true;
			request.setAttribute("showSpinner", true);
			boolean isMoneyDebited = dbUtil.withdrawMoney(id, balance, withdrawAmount);
			 showSpinner=false;
			 request.setAttribute("showSpinner", false);
			request.setAttribute("isMoneyDebited", isMoneyDebited);
		}
		
		response.sendRedirect(request.getContextPath()+"/success.jsp");
	}


	private void makeTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		double balance = Double.parseDouble(request.getParameter("balance"));
		List<Integer> allUserId = dbUtil.getAllUserIdList();
		
		request.setAttribute("id", id);
		request.setAttribute("username", username);
		request.setAttribute("balance", balance);
		request.setAttribute("allUserId", allUserId);
		
		System.out.println(allUserId);

		RequestDispatcher dispatcher =  request.getRequestDispatcher("/maketransaction.jsp");
		dispatcher.forward(request, response);
	}


	private void loadUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	int id = Integer.parseInt(request.getParameter("id"));
		User user = dbUtil.getUserById(id);
		request.setAttribute("theUser", user);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/updateUser.jsp");
		dispatcher.forward(request, response);
		
	}


	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	int id = Integer.parseInt(request.getParameter("id"));
//		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");

		User user = new User(id, firstName, lastName, password);
			
		dbUtil.updateUser(user);
		response.sendRedirect(request.getContextPath()+"/UserController");
	}


	private void getPassbook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
    	System.out.println("before");
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		double balance = Double.parseDouble((request.getParameter("balance")));
		
		List<Transaction> passbook = new ArrayList<>();
		System.out.println("after");
		request.setAttribute("id", id);
		request.setAttribute("username", username);
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("balance", balance);
		
		passbook = dbUtil.getTransactionById(id);
		System.out.println("===========tran============"+passbook);
//		response.sendRedirect(request.getContextPath()+"/user-transaction.jsp");
		request.setAttribute("userPassbook", passbook);
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("/passbook.jsp");
		dispatcher.forward(request, response);
		
	}


	private void userHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
    	HttpSession session = request.getSession();
    	String username = (String) session.getAttribute("username");
    	
        List<User> userData =dbUtil.getUserByUsername(username);
        System.out.println(userData);
        request.setAttribute("userData", userData);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/user-home.jsp");
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

		List<Transaction> transaction = dbUtil.getTransactionById(id);
		System.out.println(transaction);
//		response.sendRedirect(request.getContextPath()+"/user-transaction.jsp");
		request.setAttribute("userTransaction", transaction);
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("/list-transactions.jsp");
		dispatcher.forward(request, response);
//
	}

    
    private void transferMoney(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int fromUserId = Integer.parseInt(request.getParameter("id"));
        double fromUserBalance = Double.parseDouble(request.getParameter("balance"));
        int toUserId = Integer.parseInt(request.getParameter("toUserId"));
        double transferAmount = Double.parseDouble(request.getParameter("transferAmount"));
        User tempUser = dbUtil.getUserById(toUserId);
        System.out.println("tempUser = "+ tempUser);
        if(tempUser == null) {
        	response.sendRedirect(request.getContextPath() +"/404-Not-Found.jsp");
        }
        if(dbUtil.getAllUserIdList().contains(toUserId)) {
        	boolean isMoneyTransferred = dbUtil.transferMoney(fromUserId, fromUserBalance, toUserId, transferAmount);
        	response.sendRedirect(request.getContextPath() + "/success.jsp");
        }


        
        
    }



	
   }

