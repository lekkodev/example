result = feature(
    description = "Feature used for the hello world example",
    default = "world?!",
    rules = [
        ("context-key == \"a\"", "first rule!"),
        ("context-key == \"customer-a\"", "thing for customer a"),
        ("context-key pr", "unknown context-key"),
    ],
)
