//
//  ViewController.swift
//  TouchGame
//
//  Created by ZhuYue on 2016-05-15.
//  Copyright © 2016 ZhuYue. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = NSTimer()
    
    private let white:UIColor = UIColor(
        red: 0,
        green: 0,
        blue: 0,
        alpha: 1.0)
    
    private let black:UIColor = UIColor(
        red: 255,
        green: 255,
        blue: 255,
        alpha: 1.0)
    
    private func moveLabel(a:UILabel,b:UILabel){
        a.backgroundColor = b.backgroundColor
    }
    
    private func moveButton(a:UIButton,b:UILabel){
        a.backgroundColor = b.backgroundColor
    }
    
    private func buttonTransparent(a:UIButton){
        a.backgroundColor = UIColor(red:0,green: 0,blue: 0,alpha: 0.0)
    }
    private func labelTransparent(a:UILabel){
        a.backgroundColor = UIColor(red:0,green: 0,blue: 0,alpha: 0.0)
    }
    private func generateColorlabel(a:UILabel, b:UILabel){
        let i = arc4random()%2
        var c:UIColor = white
        var d:UIColor = black
        if(i == 1) {
            c = black
            d = white
        }
        a.backgroundColor = c
        b.backgroundColor = d
    }
    private func generateColorbutton(a:UIButton, b:UIButton){
        let i = arc4random()%2
        var c:UIColor = white
        var d:UIColor = black
        if(i == 1) {
            c = black
            d = white
        }
        a.backgroundColor = c
        b.backgroundColor = d
    }
    
    func timerAction() {
        counter += 0.01
    }
    var correct:Int = 0
    @IBOutlet weak var Starttext: UIButton!
    @IBAction func Start(sender: UIButton) {
        correct = Int(arc4random()%2)
        if(correct == 1){
            instruction.text = "Touch white"
        } else {
            instruction.text = "Touch black"
        }
        generateColorbutton(left, b: right)
        generateColorlabel(Stack11, b: Stack12)
        generateColorlabel(Stack21, b: Stack22)
        generateColorlabel(Stack31, b: Stack32)
        generateColorlabel(Stack41, b: Stack42)
        generateColorlabel(Stack51, b: Stack52)
        generateColorlabel(Stack61, b: Stack62)
        sender.tintColor = UIColor(red: 0,green: 0,blue: 0,alpha: 0.0)
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        sender.enabled = false
        left.enabled = true
        right.enabled = true
    }
    @IBOutlet weak var Stack11: UILabel!
    @IBOutlet weak var Stack12: UILabel!
    @IBOutlet weak var Stack21: UILabel!
    @IBOutlet weak var Stack22: UILabel!
    @IBOutlet weak var Stack31: UILabel!
    @IBOutlet weak var Stack32: UILabel!
    @IBOutlet weak var Stack41: UILabel!
    @IBOutlet weak var Stack42: UILabel!
    @IBOutlet weak var Stack51: UILabel!
    @IBOutlet weak var Stack52: UILabel!
    @IBOutlet weak var Stack61: UILabel!
    @IBOutlet weak var Stack62: UILabel!
    

    @IBOutlet weak var instruction: UILabel!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    

    @IBAction func Step(sender: UIButton) {
        var correctColor:UIColor = white
        if(correct == 1) {
            correctColor = black
        }
        if(sender.backgroundColor == correctColor){
            moveButton(left, b: Stack11)
            moveButton(right, b: Stack12)
            moveLabel(Stack11, b: Stack21)
            moveLabel(Stack12, b: Stack22)
            
            moveLabel(Stack21, b: Stack31)
            moveLabel(Stack22, b: Stack32)
            
            moveLabel(Stack31, b: Stack41)
            moveLabel(Stack32, b: Stack42)
            
            moveLabel(Stack41, b: Stack51)
            moveLabel(Stack42, b: Stack52)
            
            moveLabel(Stack51, b: Stack61)
            moveLabel(Stack52, b: Stack62)
            
            generateColorlabel(Stack61, b: Stack62)
        } else {
            timer.invalidate()
            buttonTransparent(left)
            buttonTransparent(right)
            labelTransparent(Stack11)
            labelTransparent(Stack12)
            labelTransparent(Stack21)
            labelTransparent(Stack22)
            labelTransparent(Stack31)
            labelTransparent(Stack32)
            labelTransparent(Stack41)
            labelTransparent(Stack42)
            labelTransparent(Stack51)
            labelTransparent(Stack52)
            labelTransparent(Stack61)
            labelTransparent(Stack62)
            Starttext.enabled = true
            Starttext.tintColor = UIColor.blueColor()
            Starttext.setTitle("Click to restart", forState: .Normal)
            instruction.text = String(counter.roundToPlaces(2))
            left.enabled = false
            right.enabled = false
            counter = 0.0
            
        }
    }
    
}

