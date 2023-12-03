package com.aurionpro.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.aurionpro.model.Admin;
import com.aurionpro.model.Transaction;
import com.aurionpro.model.User;
import com.sun.xml.internal.ws.client.Stub;

public class BankDbUtil {
	private DataSource dataSource;

	public BankDbUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public boolean checkAdmin(Admin admin) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		try {
			conn = dataSource.getConnection();
			String sql = "select * from admin";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				String username = result.getString("username");
				String password = result.getString("password");

				System.out.println(admin);
				if(admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
				
					return true;
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return false;
	}
	
	private void close(Connection conn, Statement stmt, ResultSet result) throws SQLException {
		if(conn!=null) {
			conn.close();
		}
		if(stmt!=null) {
			stmt.close();
		}
		if(result!=null) {
			result.close();
		}
	}

	public boolean checkUser(User user) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		try {
			conn = dataSource.getConnection();
			String sql = "select * from user";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				String username = result.getString("username");
				String password = result.getString("password");
				
				if(user.getUsername().equals(username) && user.getPassword().equals(password)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return false;
	}

	public void addNewUser(User tempUser) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		try {
			conn = dataSource.getConnection();
			String sql = "insert into user(firstName, lastName, username, password,balance) values(?,?,?,?,?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tempUser.getFirstName());
			stmt.setString(2, tempUser.getLastName());
			stmt.setString(3, tempUser.getUsername());
			stmt.setString(4, tempUser.getPassword());
			stmt.setDouble(5, tempUser.getBalance());
			stmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, null);
		}
	}

	public boolean isUsernameExist(String username) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		try {
			conn = dataSource.getConnection();
			String sql = "select * from user";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				String usernameDb = result.getString("username");
				
				if(username == usernameDb) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return false;
	}

	public List<User> getAllUser() throws SQLException {
		Connection conn=null;
		Statement stmt = null;
		ResultSet result = null;
		List<User> users = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			String sql = "select * from user";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				int id = result.getInt("user_id");
				String firstName = result.getString("firstname");
				String lastName = result.getString("lastname");
				String username = result.getString("username");
				String password = result.getString("password");
				int balance = result.getInt("balance");
				
				User tempUser = new User(id,firstName,lastName,username,password,balance);
				users.add(tempUser);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return users;
	}

	public List<User> searchUsers(String searchInput, String searchBasedOn) throws SQLException {
		Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet result = null;
	    List<User> users = new ArrayList<>();
	    System.out.println(searchBasedOn);
	    try {
	        conn = dataSource.getConnection();
	        switch (searchBasedOn) {
	        case "id":
	        	stmt = conn.prepareStatement("SELECT * FROM user WHERE user_id LIKE ?");
	            break;
	        case "firstName":
	        	stmt = conn.prepareStatement("SELECT * FROM user WHERE firstName LIKE ?");
	            break;
	        case "lastName":
	        	stmt = conn.prepareStatement("SELECT * FROM user WHERE lastName LIKE ?");
	            break;
	        case "username":
	        	stmt = conn.prepareStatement("SELECT * FROM user WHERE username LIKE ?");
	            break;
	        default:
	        	stmt = conn.prepareStatement("SELECT * FROM user");
	        	break;
	    }
	        stmt.setString(1,searchInput);
	        result = stmt.executeQuery();

	        while (result.next()) {
	            int id = result.getInt("user_id");
	            String firstName = result.getString("firstName");
	            String lastName = result.getString("lastName");
	            String username = result.getString("username");
	            String password = result.getString("password");
	            int balance = result.getInt("balance");
	            User tempUser = new User(id,firstName,lastName,username,password,balance);
	            System.out.println(tempUser);
	            users.add(tempUser);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(conn, stmt, result);
	    }

	    return users;
	}

	public List<Transaction> getTransactionById(int id) throws SQLException {
		Connection conn=null;
		Statement stmt = null;
		ResultSet result = null;
		List<Transaction> transactions = new ArrayList<>();
		try {
			System.out.println("inside transaction util");
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM transaction WHERE user_id ="+id+" OR to_user_id ="+id;
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);

			while(result.next()) {
				int trans_id = result.getInt("transaction_id");
				int from_user = result.getInt("user_id");
				int to_user = result.getInt("to_user_id");
				String transaction_type = result.getString("transaction_type");
				double amount = result.getInt("amount");
				String transaction_time = result.getString("transaction_time");
				
				Transaction tempTransaction = new Transaction(trans_id,from_user,to_user,transaction_type,amount,transaction_time);
//				System.out.println(tempTransaction);
				transactions.add(tempTransaction);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return transactions;
	}

	public void deleteUserById(int id) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		try {
			conn = dataSource.getConnection();
			String sql = "delete from user where user_id="+id;
			stmt = conn.prepareStatement(sql);
//			stmt.setInt(1, id);
			stmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, null);
		}
	}
	
	public List<User> getUserByUsername(String username) throws SQLException {
		Connection conn=null;
		Statement stmt = null;
		ResultSet result = null;
		User tempUser = null;
		List<User>  users = new ArrayList<>();
		try {
			System.out.println("inside get user by usename util "+ username);
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM user WHERE username ='"+username+"'";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);

			while(result.next()) {
				int id = result.getInt("user_id");
				String firstname = result.getString("firstname");
				String lastname = result.getString("lastname");
//				String username = result.getString("username");
				String password = result.getString("password");
				double balance = result.getDouble("balance");
				
				
				tempUser = new User(id,firstname,lastname,username,password,balance);
				users.add(tempUser);
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return users;

	}

	public void updateUser(User user) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		try {
			conn = dataSource.getConnection();
			String sql = "update user set firstname=?, lastname=?, password=? where user_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getFirstName());
			stmt.setString(2, user.getLastName());
			stmt.setString(3, user.getPassword());
			stmt.setInt(4, user.getId());
			stmt.execute();
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, null);
		}
		
	}

	public User getUserById(int id) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		User tempUser=null;
		try {
			conn = dataSource.getConnection();
			String sql = "select * from user where user_id=?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, id);
			result = stmt.executeQuery();
			
			if(result.next()) {
				
				String fname = result.getString("firstname");
				String lname = result.getString("lastname");
				String password = result.getString("password");
				
				tempUser = new User(id,fname,lname,password);

			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}

		return tempUser;

	}

	@SuppressWarnings("resource")
	public boolean withdrawMoney(int id, double currentBalance, double withdrawAmount) throws SQLException {
		Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        Transaction newTransaction = null;
        try {
            connection = dataSource.getConnection();
            String getBalanceQuery = "SELECT balance FROM user WHERE user_id = ?";
            stmt = connection.prepareStatement(getBalanceQuery);
            stmt.setInt(1, id);
            result = stmt.executeQuery();

            double newBalance = currentBalance - withdrawAmount;

            String updateBalanceQuery = "UPDATE user SET balance = ? WHERE user_id = ?";
            stmt = connection.prepareStatement(updateBalanceQuery);
            stmt.setDouble(1, newBalance);
            stmt.setInt(2, id);
            stmt.execute();
            newTransaction = new Transaction(id, "Withdraw", withdrawAmount);
            System.out.println("transaction = = = "+newTransaction);
            return updateTransaction(newTransaction);

        }  catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			close(connection, stmt, result);
		}
	}
	
	public boolean depositMoney(int id, double balance, double depositAmount) throws SQLException {
		Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        Transaction newTransaction = null;
        try {
            connection = dataSource.getConnection();
            String getBalanceQuery = "SELECT balance FROM user WHERE user_id = ?";
            stmt = connection.prepareStatement(getBalanceQuery);
            stmt.setInt(1, id);
            result = stmt.executeQuery();

            double newBalance = balance + depositAmount;

            String updateBalanceQuery = "UPDATE user SET balance = ? WHERE user_id = ?";
            stmt = connection.prepareStatement(updateBalanceQuery);
            stmt.setDouble(1, newBalance);
            stmt.setInt(2, id);
            stmt.execute();
            newTransaction = new Transaction(id, "Deposit",depositAmount);
            System.out.println("transaction = = = "+newTransaction);
            return updateTransaction(newTransaction);

        }  catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			close(connection, stmt, result);
		}
		
	}
	
	@SuppressWarnings("resource")
	public boolean transferMoney(int fromUserId, double fromUserBalance, int toUserId, double transferAmount) throws SQLException {
	    Connection connection = null;
	    PreparedStatement stmt = null;
	    ResultSet result = null;
	    Transaction fromUserTransaction = null;
	    Transaction toUserTransaction = null;

	    try {
	        connection = dataSource.getConnection();

	        if (fromUserBalance >= transferAmount) {

	            double newFromUserBalance = fromUserBalance - transferAmount;
	            String updateFromUserBalanceQuery = "UPDATE user SET balance = ? WHERE user_id = ?";
	            stmt = connection.prepareStatement(updateFromUserBalanceQuery);
	            stmt.setDouble(1, newFromUserBalance);
	            stmt.setInt(2, fromUserId);
	            stmt.execute();
	            fromUserTransaction = new Transaction(fromUserId, toUserId, "Transfer to " + toUserId, -transferAmount);
	            updateTransferTransaction(fromUserTransaction);

	            String getToUserBalanceQuery = "SELECT balance FROM user WHERE user_id = ?";
	            stmt = connection.prepareStatement(getToUserBalanceQuery);
	            stmt.setInt(1, toUserId);
	            result = stmt.executeQuery();
	            double toUserBalance = 0;
	            if (result.next()) {
	                toUserBalance = result.getDouble("balance");
	            }

	            double newToUserBalance = toUserBalance + transferAmount;
	            String updateToUserBalanceQuery = "UPDATE user SET balance = ? WHERE user_id = ?";
	            stmt = connection.prepareStatement(updateToUserBalanceQuery);
	            stmt.setDouble(1, newToUserBalance);
	            stmt.setInt(2, toUserId);
	            stmt.execute();
	            toUserTransaction = new Transaction(fromUserId , toUserId, "Transfer from " + fromUserId, transferAmount);
	            updateTransferTransaction(toUserTransaction);

	            return true;
	        } else {
	            return false; 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        close(connection, stmt, result);
	    }
	}

	
	
	private boolean updateTransferTransaction(Transaction transaction) throws SQLException {
		Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = dataSource.getConnection();

            String insertTransactionQuery = "INSERT INTO transaction (user_id, to_user_id, transaction_type, amount) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertTransactionQuery);
            stmt.setInt(1, transaction.getFrom_user());
            stmt.setInt(2, transaction.getTo_user());
            stmt.setString(3, transaction.getTransaction_type());
            stmt.setDouble(4, transaction.getAmount());
            stmt.execute();
            return true;
        } catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			close(connection, stmt, null);
		}   
	}
	
	
	private boolean updateTransaction(Transaction transaction) throws SQLException {
		Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = dataSource.getConnection();
            String insertTransactionQuery = "INSERT INTO transaction (user_id, transaction_type, amount) VALUES (?, ?, ?)";
            stmt = connection.prepareStatement(insertTransactionQuery);
            stmt.setInt(1, transaction.getFrom_user());
            stmt.setString(2, transaction.getTransaction_type());
            stmt.setDouble(3, transaction.getAmount());
            stmt.execute();
            return true;
        } catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			close(connection, stmt, null);
		}   
	}

	public void setUserStatus(boolean status,int id) throws SQLException {
		Connection conn=null;
		PreparedStatement stmt = null;
		System.out.println("Inside before user set status"+ status + "  "+id);
		try {
			System.out.println("Inside user set status");
			conn = dataSource.getConnection();
			String sql = "UPDATE user SET isUserActive = ? Where user_id= ?";
			stmt = conn.prepareStatement(sql);
			stmt.setBoolean(1, status);
            stmt.setInt(2, id);
			stmt.execute();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, null);
		}
	}
	
	public boolean checkUserStatus(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM user WHERE username = ? AND isUserActive = true";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			result = stmt.executeQuery();
			
			while(result.next()) {
				String username = result.getString("username");
				
				if(user.getUsername().equals(username)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return false;
	}

	@SuppressWarnings("null")
	public List<Integer> getAllUserIdList() throws SQLException {
		
		Connection conn=null;
		Statement stmt = null;
		ResultSet result = null;
		List<Integer> userIds = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from user";
			
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				int id = result.getInt("user_id");
				
				userIds.add(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, stmt, result);
		}
		return userIds;
	}
	
}
