# Testing Java with JUnit 5

## Setting up
First of all, fork this repository and clone it. Then initialize a new gradle project using (on Windows):
```
.\gradlew.bat init --dsl kotlin --project-name sea8-excercises-junit5-getting-started --test-framework junit-jupiter --type java-application --package com.wildcodeschool.sea8.exercise.junit_jupiter_getting_started
```
This sets up a gradle application project ready to use with the JUnit-Jupiter testing framework.

If you are being asked the following:
```
Generate build using new APIs and behavior (some features may change in the next minor release)? (default: no) [yes, no]
```
You should either just press enter or type `no`.

After the task finished, you should have a working gradle application project that you can now modify in order to try out JUnit!

## Dependencies
Since we already set up the Java application project accordingly, the JUnit Jupiter dependency is already present, nontheless you should chekck out the dependencies it needs.

In `app/build.gradle.kts` you will find the following lines relevant for JUnit:
```
...
dependencies {
    // Use JUnit Jupiter for testing.
    testImplementation("org.junit.jupiter:junit-jupiter:5.8.1")
    ...
}
...
tasks.named<Test>("test") {
    // Use JUnit Platform for unit tests.
    useJUnitPlatform()
}
```
Under `dependencies` we include JUnit's Maven package as a testing dependency. This means that it will be automatically downloaded and included for use with our unit tests.

The last part specifies that we want to indeed execute the JUnit tests when we execute `.\gradlew.bat test`.

## Writing tests

For writing your tests, please refer to the [JUnit 5 Documentation on Writing Tests](https://junit.org/junit5/docs/current/user-guide/#writing-tests).

You can copy their `MyFirstJUnitJupiterTests` class, but try renaming it so that it fits the proper convention.

You will notice that they provide a first test for testing a `Calculator` class - which we don't have yet.

As we learned from the presentation on **Test Driven Development**, write your tests for the `Calculator` class and then implement the `Calculator` class accordingly. You can write more tests than the one from the example - maybe try adding methods for subtracting, multiplying and dividing.

Finally, test your implementation. You can try deliberately breaking a function you are testing - see what happens.