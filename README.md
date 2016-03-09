# ReactiveCocoa-Playground
Experiment with ReactiveCocoa in a Playground, fer learnin'

## Overview
There are lots of helpful [docs over in the Reactive Cocoa repo](https://github.com/ReactiveCocoa/ReactiveCocoa/tree/master/Documentation), but sometimes that's not enough. Sometimes you wanna experiment in a playground! That's where this tool comes in.

## Getting Started
0. Clone the repo, and run `pod install` in the root directory to have Cocoapods install ReactiveCocoa.
0. Pop open the `.xcworkspace` file here, and check out the playgrounds.

## How to Add a Playground
Add a new playground file to the Xcode project (let's call it "Cool New Playground"). Then, open the file `Podfile` and add the playground name, like so: 
```
platform :ios, '9.0'
use_frameworks!  
link_with 'ReactiveCocoa Playground', 'Hello World', 'Flatten Latest', 'Cool New Playground'

pod 'ReactiveCocoa', '~> 4.0'
```

Then, just run `pod update`, and you'll be all set!

Make sure to import all these goodies in your playground; you'll probably want 'em:
```
import UIKit
import XCPlayground
import ReactiveCocoa
import enum Result.NoError
```

## Acknowledgements
[Little Bites of Cocoa | #138: Using CocoaPods in Xcode Playgrounds](https://littlebitesofcocoa.com/138-using-cocoapods-in-xcode-playgrounds)
