## Swift Regular Expressions Playground
A playground for testing regular expressions in Swift!

Code used and inspired by [this NSHipster article](https://nshipster.com/nsregularexpression/). See the article for more about the implementation details.

Drop in a few lines and test your regular expression:

```Swift
lines = [
    "githawk/githawkapp#2398",
    "#2398",
    "githawk/githawk-app#2398",
    "(#2398)"
]

test(regex: "(^|\\s)((\\w+)/(\\w+))?#([0-9]+)")
test(regex: "(^|\\s|[^a-zA-Z0-9/])(([\\w|-]+)/([\\w|-]+))?#([0-9]+)(?![a-zA-Z0-9])")

/*
prints ->
Testing: "(^|\s)((\w+)/(\w+))?#([0-9]+)"
Found match: "githawk/githawkapp#2398"
Found match: "#2398"

Testing: "(^|\s|[^a-zA-Z0-9/])(([\w|-]+)/([\w|-]+))?#([0-9]+)(?![a-zA-Z0-9])"
Found match: "githawk/githawkapp#2398"
Found match: "#2398"
Found match: "githawk/githawk-app#2398"
Found match: "(#2398)"
*/
```

If you'd like to see detail on the capture groups, toggle the paremeter printMatches to true:

```Swift
lines = [
    "githawk/githawkapp#2398",
    "#2398",
    "githawk/githawk-app#2398",
    "(#2398)"
]

test(
    regex: "(^|\\s)((\\w+)/(\\w+))?#([0-9]+)",
    printMatches: true
)

test(
    regex: "(^|\\s|[^a-zA-Z0-9/])(([\\w|-]+)/([\\w|-]+))?#([0-9]+)(?![a-zA-Z0-9])",
    printMatches: true
)

/*
prints ->
Testing: "(^|\s)((\w+)/(\w+))?#([0-9]+)"
Found match: "githawk/githawkapp#2398"
match[0]: githawk/githawkapp#2398
match[1]:
match[2]: githawk/githawkapp
match[3]: githawk
match[4]: githawkapp
match[5]: 2398
Found match: "#2398"
match[0]: #2398
match[1]:
match[5]: 2398

Testing: "(^|\s|[^a-zA-Z0-9/])(([\w|-]+)/([\w|-]+))?#([0-9]+)(?![a-zA-Z0-9])"
Found match: "githawk/githawkapp#2398"
match[0]: githawk/githawkapp#2398
match[1]:
match[2]: githawk/githawkapp
match[3]: githawk
match[4]: githawkapp
match[5]: 2398
Found match: "#2398"
match[0]: #2398
match[1]:
match[5]: 2398
Found match: "githawk/githawk-app#2398"
match[0]: githawk/githawk-app#2398
match[1]:
match[2]: githawk/githawk-app
match[3]: githawk
match[4]: githawk-app
match[5]: 2398
Found match: "(#2398)"
match[0]: (#2398
match[1]: (
match[5]: 2398

*/
```
