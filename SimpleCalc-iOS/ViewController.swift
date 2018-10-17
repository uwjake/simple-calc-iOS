//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by iGuest on 10/15/18.
//  Copyright © 2018 Jake Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnPressed(_ sender: Any) {
//        NSLog("1 pressed")
        print((sender as AnyObject).tag)
    }
}

