// DOM = document object model
/* pay attention that
1- (5=='5') is TRUE	 , (5=="5") is also true	,	(5==='5') is FALSE
*/



/* API
application programming interface (functions-instructions can be called APIs)
spacific APIs: 	document.getElementById('');		// if 2 elements have the same ID then this API will return the first one
				document.getElementsByClassName('');
				document.getElementsByTagName('');
				element.innerHTML = .... ;
				element.style.SOMEATTRIBUTE = "..." ;
				element.className = "..." ;
				element.setAttribute(name,value);
				element.removeAttribute(nameOfAttribute);
*/



/* OUTPUT
1- window.alert("...");			// just an alert message with ONE "ok" button
2- window.prompt("...");		// just like an alert but with text box for input with TWO buttons "ok" and "cancel"
3- document.write("...");		// the string is written in the page (we can use tags too)		// not a great way to use
4- innerHTML= "...";			// changes the html of an element
5- console.log();				// this doesn't appear at all but you can see it in the consol (usually used for debugging)
*/



/* VARIABELS
var x = prompt("HI") ;		// case-sensitive , can't start with a digit , it is better to make it mnemonic (meaningful)

Data Types
var x = prompt ("enter your name");			// string
var x = window.location;					// string
var x = window.innerWidth;					// number
var x = window.closed;						// boolean
var x = document.getElementById()			// object
var x = Date();								// object
var x = document.getElementsByTagName()		// array
*/



/* OPERATORS AND EXPRESSIONS
statement: 		is one line of code (ending with ";")
expression: 	is a part of a statement that has a value
operators: 		arithmatic (+ - * / % ++ -- += -=)		string (+ +=)	boolean (== != < > <= >=  === !==)		logical (&&  ||  !)
*/



/* FUNCTIONS
Declaration : function NAME (PARAMETERS){ CODE ; .. -return somth; OR MAYBE NOT- }	// functions can have {retuen value;}
*/

/* CODE PLACEMENT
<script src=" ... "></script>
*/

/* FOLDER STRUCTURE
<main folder>
HTML code is here
	<CSS folder></CSS folder>
	<JS folder></JS folder>
	<images folder></images folder>
</main folder>
to go back 1 folder use two dots. exp: to link an image inside a css file we can use url("../images/imageName.png")
*/

/* EVENTS
onclick	-	onmouseover	-	onresize (when the browser window is resized)	-	onload (use in the body tag)
exp: <p onclick="dosmth('..')">....</p>
*/

/* THIS key word */



/* ARRAYS
var images = document.getElementsByTagName['img'];
var info = ["ali",15,'c'];
array.length		array.sort()		array.push(element) <=> array[array.length]=element -> arrays are dynamic
document.write(arrayName);
*/



/* INTERATION = LOOPING
for(i=0;i<5;i++){...;}
*/

/* CONDITIONS
-	if () {...;} else {...;}
*/



/* FORMS
<form>
	<label for='name'>Name</label>
	<input type='text' id='name' name='username'>
	<br/>

	<label>Email:
		<input type='email' id='email' name='email'>
	</label>
	<be/>

	<label for='birth'>BirthDate</label>
	<input type='date' id='birth' name='birthdate'>
	<br/>

	<input type='submit' value='click here'>
</form>

- Attributes for form elements:
1- type 	textfield, email, email, password, radiobutton, chechbox, submit, date, number, color, range, url

2- id 		3- name 	3- value 	4- placeholder
*/



/* VALIDATION
// What do you want to validate ?
1- the type of the input 	2- the format of the input 		3- the value of the input
// how to validate ?
1- via HTML input types 		-- if supported by the browser so it is not garanteed
2- via HTML input attributes: 	-- {required} very annoying while testing and developing so you can use {novalidate} for the from 
								untill you are done with the code then make sure you remove it at last
								-- {pattern} works with text type of input and require input to have a specific form, exp:
								[0-9]{5} = you can only inter digits and there has to be 5 of them
								[0-9]{13-16}  = you can only inter digits and there has to be 13 to 16 of them
								[a-zA-Z]+ = you can only inter charechters and there has to be at least 1
								/////////////////////// for more patterns visit (html5patterns.com) //////////////////////
3- last and best ( ( JS ) )
*/



/* JS VALIDATION (comparing two inputs)
//JS//
function check() {
	var mail1 = document.getElementById("mail1");
	var mail2 = document.getElementById("mail2");
	if ( mail1.value != mail2.value )
	{
	alert('emails are not the same');
	return false;
	}
	else
	return true;
}
//HTML//
oninput/OR/onchange/OR/onclick(forthebutton) ...  = ' check() ; '
*/



/* CHECKBOXes and RADIO BUTTONs
- all options (choices) must have the same {{{{{{name='smth'}}}}}}
- it is a very good idea to use labels with these because it is hard to click RIGHT INSIDE the box
	( while with the label you can click on the word too )
- in JS there is an attribute called (checked) for dealing with these
- in HTML also we can use the {checked} attribute to PRE-CHECK one of the options
*/

// form builder : 		www.wufoo.com


 