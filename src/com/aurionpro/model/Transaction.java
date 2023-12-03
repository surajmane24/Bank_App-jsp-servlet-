package com.aurionpro.model;

public class Transaction {
	private int id;
	private int from_user;
	private int to_user;
	private String transaction_type;
	private double amount;
	private String transaction_time;
	public Transaction(int id, int from_user, int to_user, String transaction_type, double amount,
			String transaction_time) {
		super();
		this.id = id;
		this.from_user = from_user;
		this.to_user = to_user;
		this.transaction_type = transaction_type;
		this.amount = amount;
		this.transaction_time = transaction_time;
	}
	public Transaction(int from_user, int to_user, String transaction_type, double amount) {
		super();
		this.from_user = from_user;
		this.to_user = to_user;
		this.transaction_type = transaction_type;
		this.amount = amount;
	}
	public Transaction(int from_user, String transaction_type, double amount) {
		super();
		this.from_user = from_user;
		this.transaction_type = transaction_type;
		this.amount = amount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFrom_user() {
		return from_user;
	}
	public void setFrom_user(int from_user) {
		this.from_user = from_user;
	}
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getTransaction_time() {
		return transaction_time;
	}
	public void setTransaction_time(String transaction_time) {
		this.transaction_time = transaction_time;
	}
	@Override
	public String toString() {
		return "Transaction [id=" + id + ", from_user=" + from_user + ", to_user=" + to_user + ", transaction_type="
				+ transaction_type + ", amount=" + amount + ", transaction_time=" + transaction_time + "]";
	}
	
	
	
}
