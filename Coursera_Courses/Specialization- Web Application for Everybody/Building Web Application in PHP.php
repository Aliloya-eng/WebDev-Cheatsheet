<?php


/* ARRAYS (associative arrays) key => value

	$smth = array("bla","Bla");

	$stuff = array("name" => "Ali",
					"Course" => "PHP");
	echo $stuff["Course"] . "\n"; 			//  print the value that is in the key "Course"
	print_r($stuff); 						//  print the whole key-value array
	var_dump($stuff); 						//  print the whole key-value array (but also print the type and size of each value infront of it) // and this actually
										 		prints the FALSE value
	$arr[]="Hi";							//  add "Hi" in a new position into the array (dynamic arrays) // the keys(index) will be increasing integers
	$arr["na"]="Ba";						//  add "Ba" in a new position into the array (dynamic arrays) // the key(index) of the new position is "na"

	foreach($arr as $k => $v ) {...;}

	// ARRAY FUNCTIONS
		array_key_exists($key,$arr);			// return TRUE if $key is set in $arr
		isset($arr[$key]);						// SAME (return TRUE if $key is set in $arr)
		count($arr);							// the number of elements in the array
		is_array($arr);							// returns TRUE if $arr is an array
		sort($arr);								// sorts the array (loses the key) // new keys are increasing integers
		asort($arr);							// sorts the array without losing the key association
		ksort($arr);							// sorts the array BY KEY

		$tempo = "hi, how are you ?"
		$temp = explode(' ',$tempo);			// $temp = ("0"=>"hi," , "1"=>"how" , "2"=>"are" , "3"=>"you" , "4"=>"?")

	echo  isset($arr['name'])  ?  $arr['name']  :  "name does not exist"  ;			// PHP5 or befor
	echo  $arr['name']  ??  "name does not exist"  ;								// SAME in PHP7 or later
	*/


/* FUNCTIONS
	function NAME ( $a ) {.....; ( can return smth ; ) }

	* you can use a default value for a parameter like this -in the declaration-  :   function NAME ( $a="ABC" ) {.....; ( can return smth ; ) }
	// this way if we didn't pass anything as a parameter then $a will be "ABC" , if we pass a value then $a will take the value we pass

	* we can pass the variable itself to the function instead of just passing the value of the variable ((call by reference) instead of (call by value))
	like this : -while calling-  echo NAME (& $V_Variable);			// so this function actually intents to modify and change the value of $V_Variable


	// Variable Scope
		the function can't see the variables outside it (except if passed as arguments) , so we can use the same name inside and outside (as 2 different references)
		to use a variable inside the function that has been initialized outside the function we should use the word "global"  // rerely used (most cases can be avoided)
	*/


/* Modularity
	include "header.php";					// if "header.php" doesn't exist it will be ignored
	include_once "maybe_footer.php";
	require "smth.php";						// if "smth.php" doesn't exist it will cause an error
	require_once "smth.php";
	*/


/* Forms
	*the diffirence between _GET and _POST is VERY importance
	//	dont think that using one is better than the other "it depends on te case"- think about bookmarking a link
	// NEVER use GET with links that modifies data 			// use GET only with "static or simi-static pages"

	* we use "" htmlentity($user_input); "" to refer to any text that comes from the user and sould be displayed in HTML
	//    this is a safety step (secapping html injection)
	*/


?>