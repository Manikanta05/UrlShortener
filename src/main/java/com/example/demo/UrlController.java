package com.example.demo;

import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
@ComponentScan
@Controller
public class UrlController {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private Map<String, ShortenUrl> shortenUrlList = new HashMap<>();
	
	@RequestMapping("/")
	public String home()
	{
		//System.out.println("home");
		return "index";
	}
	@RequestMapping("/adminLogin")
	public String adminlogin()
	{
		//System.out.println("AdminLogin");
		return "login";
	}
	@RequestMapping(value="/admin", method=RequestMethod.POST)
	public String admin(HttpServletResponse response,HttpServletRequest request)
	{
		String email= request.getParameter("email");
		String pwd=request.getParameter("password");
		System.out.println(email+pwd);	
		
		String abc="select * from admin";
		List<admin> listShort =jdbcTemplate.query(abc,new RowMapper<admin>() {		
			 public admin mapRow(ResultSet result, int rowNum) throws SQLException {
					admin shor=new admin();
					//System.out.println(result.getString("fullUrl")+result.getString("shortUrl"));
					shor.setName(result.getString("name"));
	                shor.setPassword(result.getString("password"));
	                shor.setEmail(result.getString("email"));
					return shor;
				}		
		});	
		for (admin aContact : listShort) {
            //System.out.println(aContact.getRandChar());
            if(aContact.getEmail().equalsIgnoreCase(email)&&aContact.getPassword().equalsIgnoreCase(pwd)) {
            	System.out.println("Matched");
            	List<ShortenUrl> url=getUrls();
        		request.setAttribute("urls",url);
        		return "admin";
            	
            }           
        }
		//return null;
		
		return "login";
		//System.out.println("Admin");
		
	}
	
	@RequestMapping(value="/deleteUrl/{rc}", method=RequestMethod.GET)
		public String delete(HttpServletResponse response,HttpServletRequest request, @PathVariable("rc") String rc) {
		 String sqlDelete = "DELETE FROM short where randChar=?";
		 try {
	        jdbcTemplate.update(sqlDelete, rc);
	        //System.out.println("deleted");
		 } catch (DataAccessException ex) {
			    ex.printStackTrace();
			    return "error";
			}
	        
		 return "delete";
		}
	
	
	@RequestMapping(value="/shortenurl", method=RequestMethod.POST)
	public ResponseEntity<Object> getShortenUrl(@RequestBody ShortenUrl shortenUrl) throws MalformedURLException {
		//System.out.println("short");
		String randomChar = getRandomChars();
		//setShortUrl(randomChar, shortenUrl);
		setSURL(randomChar, shortenUrl);
		return new ResponseEntity<Object>(shortenUrl, HttpStatus.OK);
	}
	
	@RequestMapping(value="/short.ly/{randomstring}", method=RequestMethod.GET)
	public void getFullUrl(HttpServletResponse response, @PathVariable("randomstring") String randomString) throws IOException {
		
		
		String resp=getSURL(randomString);
		if(resp!=null) {
			response.sendRedirect(resp);
		}
		
		//response.sendRedirect(shortenUrlList.get(randomString).getFull_url());
	}

	

	private String getRandomChars() {
		String randomStr = "";
		String possibleChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		for (int i = 0; i < 5; i++)
			randomStr += possibleChars.charAt((int) Math.floor(Math.random() * possibleChars.length()));
		return randomStr;
	}
		
	public void setSURL(String randomChar, ShortenUrl shortenUrl) {
		// TODO Auto-generated method stub
		String abcd="select fullUrl,randChar from short";
		List<ShortenUrl> listShort =jdbcTemplate.query(abcd,new RowMapper<ShortenUrl>() {		
			 public ShortenUrl mapRow(ResultSet result, int rowNum) throws SQLException {
					ShortenUrl shor=new ShortenUrl();
					//System.out.println(result.getString("fullUrl")+result.getString("shortUrl"));
					shor.setFull_url(result.getString("fullUrl"));	                
	                shor.setRandChar(result.getString("randChar"));
					return shor;
				}
		});	
		int flag=0;
		for (ShortenUrl aContact : listShort) {
            //System.out.println(aContact.getRandChar());
            if(aContact.getFull_url().equalsIgnoreCase(shortenUrl.getFull_url())) {
            	//System.out.println("Matched");
            	randomChar=aContact.getRandChar();
            	flag=1;
            }           
        }
		 shortenUrl.setShort_url("http://localhost:8086/short.ly/"+randomChar);
		 if(flag==0) {
		String abc="insert into short(fullUrl,ShortUrl,randChar) values(?,?,?)";
		try {
		int res=jdbcTemplate.update(abc,shortenUrl.getFull_url(),shortenUrl.getShort_url(),randomChar);
		if(res>0) {
			System.out.println("added new line");
		}
		else
			System.out.println("Not added");
		
	}
		catch( DataAccessException ex){
			System.out.println("Some Exception");
		}
		 }
	}
	
	
	public String getSURL(String randomChar) {
		// TODO Auto-generated method stub
		String abcd="select * from short";
		List<ShortenUrl> listShort =jdbcTemplate.query(abcd,new RowMapper<ShortenUrl>() {		
			 public ShortenUrl mapRow(ResultSet result, int rowNum) throws SQLException {
					ShortenUrl shor=new ShortenUrl();
					//System.out.println(result.getString("fullUrl")+result.getString("shortUrl"));
					shor.setFull_url(result.getString("fullUrl"));
	                shor.setShort_url(result.getString("shortUrl"));
	                shor.setRandChar(result.getString("randChar"));
					return shor;
				}
		});	
		for (ShortenUrl aContact : listShort) {
            //System.out.println(aContact.getRandChar());
            if(aContact.getRandChar().equalsIgnoreCase(randomChar)) {
            	//System.out.println("Matched");
            	return aContact.getFull_url();
            }           
        }
		 return null;
}
	public List<ShortenUrl> getUrls() {
		// TODO Auto-generated method stub
		String abc="select * from short";
		List<ShortenUrl> listShort =jdbcTemplate.query(abc,new RowMapper<ShortenUrl>() {		
			 public ShortenUrl mapRow(ResultSet result, int rowNum) throws SQLException {
					ShortenUrl shor=new ShortenUrl();
					//System.out.println(result.getString("fullUrl")+result.getString("shortUrl"));
					shor.setFull_url(result.getString("fullUrl"));
	                shor.setShort_url(result.getString("shortUrl"));
	                shor.setRandChar(result.getString("randChar"));
					return shor;
				}
		});	
		
		 return listShort;
}
	
	/*
	 * 
	 * private void setShortUrl(String randomChar, ShortenUrl shortenUrl) throws MalformedURLException {
		 shortenUrl.setShort_url("http://localhost:8086/short.ly/"+randomChar);
		 shortenUrlList.put(randomChar, shortenUrl);
	}*/
}