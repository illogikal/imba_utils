import {ImbaElement} from 'imba/src/imba/dom/component'

def @setPropsFromDestructure target, name, descriptor
	const originalMethod = descriptor.value
	const setValues = do |obj, target|
		for own k,v of obj
			target[k] = v
	descriptor.value = do
		setValues(this.restProps, this) if this.restProps
		originalMethod.apply(this, $0)
	return null

def @setPropsFromImbaDataProps target, name, descriptor
	const originalMethod = descriptor.value
	const setValues = do |obj, target|
		for [k, v] in obj
			const key = k.replace('imbaProps_', '')
			v = true if v == 'true'	
			v = false if v == 'false'
			v = yes if v == 'yes'
			v = no if v == 'no'
			target[key] = v
	descriptor.value = do
		const datas = Object.entries({...this.dataset}).filter(do |[k,v]| k.match('imbaProps'))
		if datas.length
			setValues(datas, this)
		originalMethod.apply(this, $0)
	return null
	
extend class ImbaElement
	@setPropsFromDestructure @setPropsFromImbaDataProps def commit
		unless render?
			__F |= $EL_UNRENDERED$
			return self
		__F |= $EL_RENDERING$
		render && render()
		rendered()
		__F = (__F | $EL_RENDERED$) & ~$EL_RENDERING$ & ~$EL_UNRENDERED$
		
if $web$
	extend class Element
		def getFirstImbaAncestor element
			let node
			while element.parentElement
				if element.parentElement.__F
					node = element.parentElement
				element = element.parentElement
				if node
					break
			node

		def run_imba_parent_method element, method, ...data
			const imba_elem = getFirstImbaAncestor element
			imba_elem[method](...data)

