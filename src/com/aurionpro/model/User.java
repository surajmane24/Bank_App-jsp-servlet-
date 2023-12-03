package com.aurionpro.model;

public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private double balance;
	private boolean isUserActive;

    public boolean isUserActive() {
        return isUserActive;
    }

    public void setUserActive(boolean isUserActive) {
        this.isUserActive = isUserActive;
    }
	public User(int id, String firstName, String lastName, String username, String password, double balance,
			boolean isUserActive) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.balance = balance;
		this.isUserActive = isUserActive;
	}
	public User(int id, String firstName, String lastName, String username, String password, double balance) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.balance = balance;
	}
	public User(String firstName, String lastName, String username, String password,double balance) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.balance = balance;
	}
	public User(int id, String firstName, String lastName, String password) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;

	}
	public User(boolean isUserActive) {
		super();
		this.isUserActive = isUserActive;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", password=" + password + "]";
	}
	
}
