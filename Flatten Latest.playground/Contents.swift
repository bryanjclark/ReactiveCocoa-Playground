//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import ReactiveCocoa
import enum Result.NoError

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: FlattenLatest
// https://github.com/ReactiveCocoa/ReactiveCocoa/blob/master/Documentation/BasicOperators.md#switching-to-the-latest

let values: [[Int]] = [
	[1, 2, 3, 4],
	[5, 6, 7, 8],
	[9, 10, 11, 12],
]

let (producerA, observerA) = SignalProducer<String, NoError>.buffer(5)
let (producerB, observerB) = SignalProducer<String, NoError>.buffer(5)
let (producerC, observerC) = SignalProducer<String, NoError>.buffer(5)
let (signal, observer) = SignalProducer<SignalProducer<String, NoError>, NoError>.buffer(5)

var output = ""
signal.flatten(.Latest).startWithNext { output = $0 }

observer.sendNext(producerA)   // nothing printed
observerC.sendNext("X")        // nothing printed
observerA.sendNext("a")        // prints "a"
output

observerB.sendNext("1")        // nothing printed
observer.sendNext(producerB)   // prints "1"
output

observerA.sendNext("b")        // nothing printed
observerB.sendNext("2")        // prints "2"
output

observerC.sendNext("Y")        // nothing printed
observerA.sendNext("c")        // nothing printed
observer.sendNext(producerC)   // prints "X", "Y"     < NO IT DOESN'T THO
output

observerB.sendNext("3")        // nothing printed
observerC.sendNext("Z")        // prints "Z"
output

// so uhhhh wtf was that
