//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by iGuest on 10/15/18.
//  Copyright © 2018 Jake Jin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // init calc object
    var calc = Calculator()
    
    func determineOp(_ op:String, _ num:String){
        switch op {
        case "+":
            calc.add(num)
        case "-":
            calc.sub(num)
        case "×":
            calc.mul(num)
        case "÷":
            calc.div(num)
        case "MOD":
            calc.mod(num)
        case "CT":
            calc.count(num)
        case "AVG":
            calc.avg(num)
        case "FACT":
            calc.fact(num)
        default:
            print("no last op")
        }
    }
    // define result display label var
    @IBOutlet weak var dispayLabel: UILabel!
    
    
    @IBAction func btnClearPressed(_ sender: UIButton) {
        calc = Calculator()
        dispayLabel.text = "0"
    }
    
    @IBAction func btnEqualsPressed(_ sender: UIButton) {
        
        // call right method
        determineOp(calc.lastOp, dispayLabel.text!)
        dispayLabel.text = calc.getResult()
        
        // clear last Op to handle multiple equal press
        calc.lastOp = ""
        calc = Calculator()
        print(calc.getResult())
    }
    
    @IBAction func btnNumberPressed(_ sender: UIButton){
        let num = sender.currentTitle!
        let oldNum = dispayLabel.text!
        if oldNum == "0" {
            dispayLabel.text = num
        } else {
            dispayLabel.text = oldNum + num
        }
        
        if num == "." {
            calc.isDecimal = true
        }
        
        print(dispayLabel.text!)
    }
    
    @IBAction func btnOpPressed(_ sender: UIButton) {
        let currentOp = sender.currentTitle!
        calc.add(dispayLabel.text!)
        calc.lastOp = currentOp
        dispayLabel.text = "0"
        print(calc.currentResult)
    }
    
}

class Calculator {
    var lastOp = ""
    var currentResult = 0.0
    var isDecimal = false
    var count = 0
    func add(_ num: String){
        self.currentResult = self.currentResult + Double(num)!
    }
    
    func sub(_ num: String){
        self.currentResult = self.currentResult - Double(num)!
    }
    
    func mul(_ num: String){
        self.currentResult = self.currentResult * Double(num)!
    }
    
    func div(_ num: String){
        self.currentResult = self.currentResult / Double(num)!
    }
    
    func mod(_ num: String){
        self.currentResult = self.currentResult / Double(num)!
    }
    
    func count(_ num: String){
        self.currentResult += 1
    }
    
    func avg(_ num: String){
        self.currentResult += Double(num)!
        self.count += 1
        self.currentResult /= Double(count)
    }
    
    func fact(_ num: String){
        self.currentResult = Double(calcFact(factor: Int(num)!))
    }
    
    func calcFact(factor: Int)->Int{
        if (factor == 0 || factor == 1 ){
            return 1
        } else {
            return (1...factor).reduce(1, {a, b in a * b})
        }
    }
    
    func getResult()->String {
        if (self.isDecimal) {
            return String(self.currentResult)
        } else {
            return String(Int(self.currentResult))
        }
        
    }
    
    
    
    func determineDecimal(_ num: String){
        self.isDecimal = num.contains(".")
    }
   
    
   
    
}

