Colors
===========
A pure Swift library for using ANSI codes. Basically makes command-line coloring and styling very easy!

*Note: Colors `master` requires Xcode 6.3 / Swift 1.2.*

Usage
-----
Colors aims to have a simple and self-explanatory API.

```swift
import Colors

// one style
println("foo".red);

// multiple styles
println("foo".red.bold);

// multiple style sets
println("foo".red.bold + "bar".blue);

// grouped styling
println(("foo".red + "bar".blue).bold.underline);

// resets
println(("foo".red + "bar".blue).reset.red.underline.bold);
```