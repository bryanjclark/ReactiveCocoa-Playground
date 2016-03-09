//
//  ViewController.swift
//  ReactiveCocoa Playground
//
//  Created by Bryan Clark on 3/9/16.
//  Copyright © 2016 Devsign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		view.backgroundColor = .whiteColor()

		let droidLabel = UILabel()
		droidLabel.frame = view.bounds.insetBy(dx: 20, dy: 0)
		droidLabel.numberOfLines = 0
		droidLabel.lineBreakMode = .ByWordWrapping
		droidLabel.text = "These are not the droids you're looking for - go open the playground that's in this project instead!"
		view.addSubview(droidLabel)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

