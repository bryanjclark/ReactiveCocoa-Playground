//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import ReactiveCocoa
import enum Result.NoError

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: Hello, World! Here's an example from the docs, "Combining Latest Values"
// https://github.com/ReactiveCocoa/ReactiveCocoa/blob/master/Documentation/BasicOperators.md#combining-latest-values

let (signalA, observerA) = Signal<Int, NoError>.pipe()
let (signalB, observerB) = Signal<String, NoError>.pipe()
let (signalC, observerC) = Signal<Int, NoError>.pipe()

var output: String = ""
let signal = combineLatest(signalA, signalB, signalC)
signal.observeNext { next in output = "Next: \(next)" }
signal.observeCompleted { completed in output = "Completed: \(completed)" }

observerA.sendNext(0)
observerB.sendNext("A")
observerC.sendNext(100)
output

observerC.sendNext(200)
output

observerA.sendCompleted()
output

observerB.sendCompleted()
output

observerC.sendCompleted()
output