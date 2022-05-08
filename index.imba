def sleep
	do |delay| new Promise(do |resolve| setTimeout(resolve, delay))
	
def waitForCondition condition
	const poll = do(resolve)
		if condition! then resolve!
		else setTimeout(&, 30) do poll(resolve)

	new Promise(poll)

export {
	sleep
	waitForCondition
}
