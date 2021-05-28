//  	linking to JS in HTML        <script type="text/javascript" src="...."></script>

//* DEBUGGING
	alert("");
	console.log("");
	//you can set a breackpoint in the browser's debugger, then refresh to see what happns


function function_name ( , ){ ...; }
	// variabls in functions CAN'T have the same names of variables outside, if we need to name them the same then we have to use the word (var)

	a = [ "1" , "2" , "3" , { "name":"ali" , "birth":"20/6" } ]; //array
	b = array();   b.push('first');    b[1]='second';

	for( bla in a ){...};


	// First-Class Functions
		x = function(){
			document.write("x is a function");
		}


// Classes
	x = function(){
		this.var = 0;
		this.fun = function(){
			this.var = this.var + 1 ;
			document.write("fun is a function, x is a class");
		}
	}

	a = new x();


// Forms
	somtyhin.onchange(function{
	var form = $('#form');
	var text = form.find('input[name="input_name"]').val();
	$.post(														// send a post
		'page' , 												// where to go (( first parameter to the post process ))
		{'va':text}, 											// values to pass to the process
		function(data){											// this happens when we get the response back
		$('#result').empty().append(data);						// emptys the #result and then add the value (text) to it
		}
	).error(function(){											// if an error happen
		window.console && console.log('error');
		}
	);
	return false;
	})

