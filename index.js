
/*body*/
function sleep(){
	
	return function(delay) { return new Promise(function(resolve) { return setTimeout(resolve,delay); }); };
	
};
function waitForCondition(condition){
	
	const poll = function(resolve) {
		
		if (condition()) { return resolve() } else {
			return setTimeout(function() { return poll(resolve); },30);
		};
	};
	
	return new Promise(poll);
};

export {sleep,waitForCondition};
