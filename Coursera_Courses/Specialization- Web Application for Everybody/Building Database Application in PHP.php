<?php

/*
// in database in SQL command-line
GRANT ALL ON misc.*TO 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON misc.*TO 'username'@'172.0.0.1' IDENTIFIED BY 'password';
*/


////////////////////*  		 PHP With SQL      *//////////////////
	// open connection using PDO
	$conn = new PDO('mysql:host=name-of-host_OR_IP-address-of-the-host;port=3306;dbname=databasename', 'username', 'password');


	// SELECT statement + get result
	$stmt = $conn->query("SELECT * FROM some_table");
	while( $row = $stat->fetch(PDO::FETCH_ASSOC ) )   //  PDO::FETCH_ASSOC  : this get the resylt back as an array { [key] => value ....}
	{
		print_r($row);
	}



	//INSERT statement
	$sql_ins = "INSERT INTO table_name (name,email,password) VALUES (:Xname,:Yemail,:SOMEpassword)";
	$stmt=$conn->prepare($ins);
	$stmt->execute(array(
		':Xname' => $_POST['name'],
		':Yemail' => $_POST['email'],
		':SOMEpassword' => $_POST['password']
	));



	//DELETE statement   (( use this on POST only, it's bad to do it on GET ))
	if (isset($_POST['delete']) && isset($_POST['id'])){
		$sql_del="DELETE FROM table_name WHERE id=:id_holder";
		$stmt=$conn->prerpare($sql_del);
		$stmt->execute(array(
			':id_holder' => $_POST['id']
		));
	}



	//UPDATE statement
	$sql_up = "UPDATE table_name SET name='new_name' WHERE name='old_name' ";


	//SECURITY (avoiding sql injection)
	1- use htmlentities(var) to print or echo something has been read from user input (avoid HTML injection)
	2- use prepared statement to stop SQL injection through place-holders // place-holders replace the actual string after "escaping" every special character


	//showing errors  (better for security, it is not good to let the user know what is the exact problem)
	$conn->SetAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
	// then we can use try catch with a log to sent the error back to the developer 
	// you can look for the log from phpInfo or see   http://ophilipp.free.fr/op_tail.htm
	try{...}
	catch (Exception $ex) {
		echo ("internal error, please contact support");
		error_log("page_name, SQL error=" . $ex->getMessage());
		return;
	}


///////////////* 	Cookies
	//part of http protocol, created by the server and sent to the browser, then stored in the browser and sent back to the server with every request
	if( ! isset($_COOKIE['key'])) {
		setcookie('key' , 'value' , time()+'number of seconds to live');  //time()=now	
	}


///////////////* 	Session
	// stored in the server and works over cookies (the cookies "unlocks" the session). get deleted from the server and from the browser after the session is closed
	// we should start session befor any output (at the php part at the top of the code (before HTML))
	session_start(); 	// open an existing session(if exist) or creat a session (so we have to use this if we want to use the session not just to creat one)
	$_SESSION['key']="value";
	unset($_SESSION['key']);
	session_id(); 		// created automatically for every session
	session_destroy(); 	// delete all keys from the session

	// Sessions without Cookies
	we can do it through URL or through hidden forms but its not a good idea when it comes to security.
	it is only useful if you want to open one weebsite as 2 people: user and admin


///////////////* Navigation and Redirecting

	// Redirect this gets back to the broweser and makes it generate another request
	header("Location: some_url")
	*/*carefull: you must redirect befor giving any output, because the server sends all headers at the very first output it meets (any HTML tag is an output)*/*


	POST-bad_refresh!!
	// what happens if we used a post then the user press (refresh)!!??!!
	POST-redirect-get=>safe_refresh
	// whenever we use post we should then redirect (even if we redirect to the same page)
	POST-redirect-get-session
	POST-redirect-get-flash //flash is to use unset for the cookie after using it so that it doesn't appeare in refresh (((we use flash mostly for messages)))
	use sessions or/and flash to keep the data if we need  (probably to use in the VIEW(html) )


//////// Logout Page
	session_start();		// you can't destroy a session without oppening it (even if it exists you need to open it first so that you can see it !!! )
	session_destroy();
	header("Location:....");



?>