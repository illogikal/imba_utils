# imba_utils

```
yarn add illogikal/imba_utils
```

## waitForCondition

```
  import { waitForCondition } from 'imba_utils'
  ...
  await waitForCondition do someDelayedThingThatBecomesTrue

```

## sleep

```
  import { sleep } from 'imba_utils'
  ...
  await sleep 100 // waits for 100 milliseconds
  ...
```

# Element Additions

data-imba-props_ 
Add this before prop name to pass through the dataset, for the purpose of rendering to html string, for libraries that need this

```
  import 'imba_utils/element_additions'
  ...
  const cmp = <Component
    data-imba-props_testProp=true
  >
  cmp.outerHTML # renders correctly
  ...
  const cmp = <Component
    testProp=true
  >
  cmp.outerHTML # does not renders correctly
  ...
```


restProps
allows destructuring and passing props as object instead of manually writing each one out

```
  import 'imba_utils/element_additions'
  ...
  const cmp = <Component
    restProps={testProp: true}
  >
```

getFirstImbaAncestor element
Gets first imba ancestor of `element`. You might use this if you are using the `html:onclick` method to run plain javascript for some reason.

run_imba_parent_method element, method, ...data

Runs imba element `method` with `data` args on first ancestor of `element`. You might use this if you are using the `html:onclick` method to run plain javascript for some reason. Everything should be stringified as below.

`html:onclick="run_imba_parent_method(getFirstImbaAncestor(this), 'run_method', {JSON.stringify {a: 1, b:2})"`
