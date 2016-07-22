# Airports & Enums

![Airplane Landing](https://s3.amazonaws.com/learn-verified/airplane-landing.jpg)

## Objectives

 * Declare and define an enum to manage airport statuses

## Introduction
You can instantly get the status of just about anything and airports are no different. This lab takes you on the wild ride of beautifully displaying airport status information. So have a seat because there will probably be delays.

Open your `.xcworkspace` file and take a look at the project navigator. The `ViewController.swift` file is where you will be doing all your work. Outlet properties are already hooked up, along with some enum properties.

There is an optional instance property on the class called `airportDictionary` of type `NSDictionary`. When `viewDidLoad()` is called `airportDictionary` gets its value by calling a class method defined in the `Airport Status` class. This method returns a dictionary containing statuses for five major US airports. Each status includes the airport's current delay information and weather. Click on the `AirportStatus.swift` file to take a peek and see all the instance properties. Even though it's not hooked up in this lab, the class is set up to work with information received from the [FAA's REST API](http://services.faa.gov/).

Head back to the `ViewController.swift` file. The file uses extensions to organize the different parts of the class. Scroll down to the `// MARK: Enums` line to view the extension of enums that are already defined for you including one that is not, `// Airport Code Enum`. This is the enum you will make. Let's get started.

### 1. Define the Airport Code enum
---
 * Declare an enum called `AirportCode` of type `String`.
 * Define cases for the following airport codes: ATL, DFW, JFK, LAX, ORD (keep them in alphabetical order).<br />
  _Hint:_ Is there a way to define the cases in one line?

### 2. Declare an `AirportCode` property on the class
---
 Scroll up to the top of the `ViewController.swift` file to view all the instance properties. As mentioned before you will see some enum properties already declared.

 * Declare an optional enum property below the existing enum properties called `airportCode` of type `AirportCode` and assign a value of `.ATL` (That's one of your enum cases).
 * Scroll down to `viewDidLoad()` and add a print statement inside the function to print your `airportCode` property.
 * Build and run `⌘ + R` the application. You should see the optional ending in ".ATL" printed out in the console.

### 3. Assign a raw value to `airportCode` from a key inside `airportDictionary`
---
Scroll to the `airportDictionary` instance property. You'll notice that the `didSet` property observer is defined for you. The code inside the observer unwraps the dictionary, sorts the keys, and grabs the first key value. The keys inside the dictionary are the same names as the `AirportCode` cases you defined in your enum. You're going to use the `code` constant to initialize your `airportCode` property.

 * Scroll up to your `airportCode` property and remove `.ATL` as the initial value. We will no longer assign an initial value here.
 * Back inside the `didSet` observer of `airportDictionary`, assign the initial value to `airportCode` using the raw value initializer. The initializer takes a string argument.
 _Hint:_ Check out [Apple's documentation](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID145) and scroll down to the "Initializing from a Raw Value" section.

  ```swift
  if let code = sortedKeys.first {

     // declare and assign the property

  }
  ```

 * Build and run `⌘ + R` the application. You should still see the optional ending in ".ATL" printed out in the console.

### 4. Add a `didSet` property observer to the `airportCode` property and assign a value to `airportStatus`
---
So far you have created an enum but it's not really doing much. `airportDictionary` contains all the airport statuses of type `AirportStatus`. Each `AirportStatus` object has all the information you need to assign values to your view properties but we need to get it out of the dictionary first. Now that `airportCode` has an initial value we can use its raw value to access a status in `airportDictionary`. Remember that the keys inside the dictionary match the case names of your enum `["ATL": <AirportStatus>]`.

 * Expand the declaration of the `airportCode` property to include a `didSet` property observer. Use the other properties in the class as a reference.
 * Inside the `didSet` property observer, assign a value to the `airportStatus` property. You can get the value by accessing   `airportDictionary`. Use the raw value of `airportCode` as the key.<br />
 _Hint:_ Enums come with a `.rawValue` property.<br />
 _Hint:_ You will need to downcast to `AirportStatus` when accessing the status from the dictionary.
 * Build and run `⌘ + R` the application. You should see a big control tower, a pretty moon, and a Delta airplane.

### 5. Add a mutating function to the `AirportCode` enum
---
The view has a gesture set up so the user can swipe left to load the next airport status. Build and run `⌘ + R` the application. Swipe left a few times. While the transition might be fun, the information remains the same. You are going to change that! Scroll to your `AirportCode` enum to add a new method.

 * Add a mutating method called `next()` below your cases.
 _Hint:_ Check out [Apple's documentation](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Methods.html) and scroll to the section "Modifying Value Types from Within Instance Methods".
 * Inside the mutating method add a switch statement that switches `self`. The goal is to mutate the current value of `self` and change it to the next value (e.g., change `ATL` to `DFW`, `DFW` to `JFK`). The switch should be successive and exhaustive meaning the last case should switch `self` back to `ATL`.
 * Scroll to the section label `// MARK: Gesture`. Find the `changeStatusWithAnimation()` method. Use your `airportCode` property to call the `next()` method you just defined.

 ```swift
 if statusReceived {

     // call next method here

     UIView.transitionWithView(view, duration: 0.5, options: .TransitionFlipFromRight, animations: nil, completion: nil)

 }
 ```

 When `next()` is called, the next airport status is retrieved from the `airportDictionary` and the view elements are updated with new information.
 * Build and run `⌘ + R` the application. Start swiping left to see the status for each airport.
 * Test `⌘ + R` the application.
