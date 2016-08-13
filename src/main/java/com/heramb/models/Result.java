package com.heramb.models;

public class Result {

	String status;
	String message;
	
	public Result() {
		// TODO Auto-generated constructor stub
	}
	
	public Result(String status, String message) {
		super();
		this.status = status;
		this.message = message;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
}
