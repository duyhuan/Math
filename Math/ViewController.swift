//
//  ViewController.swift
//  Math
//
//  Created by techmaster on 1/4/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lblCalculation: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var lblWrong: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!

    var number1: Int = 0
    var number2: Int = 0
    var right: Int = 0
    var wrong: Int = 0
    var time: Int = 10
    var timer = Timer()
    
    let number: Int = 3
    var arrCalculation: [String] = ["+", "-", "X"]
    var numberCalculation: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomResult()
        numberCalculation = Int(arc4random_uniform(UInt32(arrCalculation.count)))
        setTimer()
    }
    
    func setTimer() {
        time = 10
        lblTime.text = String(time)
        right = 0
        wrong = 0
        lblRight.text = String(right)
        lblWrong.text = String(wrong)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    }

    func countDown() {
        time = time - 1
        lblTime.text = String(time)
        if time == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time up", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Again", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                self.setTimer()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func actionbtn1(_ sender: UIButton) {
        if numberCalculation == 0 {
            if Int(lbl1.text!)! + Int(lbl2.text!)! == Int((btn1.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 1 {
            if Int(lbl1.text!)! - Int(lbl2.text!)! == Int((btn1.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 2 {
            if Int(lbl1.text!)! * Int(lbl2.text!)! == Int((btn1.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        }
        randomResult()
    }
    
    @IBAction func actionbtn2(_ sender: UIButton) {
        if numberCalculation == 0 {
            if Int(lbl1.text!)! + Int(lbl2.text!)! == Int((btn2.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 1 {
            if Int(lbl1.text!)! - Int(lbl2.text!)! == Int((btn2.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 2 {
            if Int(lbl1.text!)! * Int(lbl2.text!)! == Int((btn2.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        }
        randomResult()
    }
    
    @IBAction func actionbtn3(_ sender: UIButton) {
        if numberCalculation == 0 {
            if Int(lbl1.text!)! + Int(lbl2.text!)! == Int((btn3.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 1 {
            if Int(lbl1.text!)! - Int(lbl2.text!)! == Int((btn3.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        } else if numberCalculation == 2 {
            if Int(lbl1.text!)! * Int(lbl2.text!)! == Int((btn3.titleLabel?.text)!) {
                right = right + 1
                lblRight.text = String(right)
            } else {
                wrong = wrong + 1
                lblWrong.text = String(wrong)
            }
        }
        randomResult()
    }
    
    func randomCalculation() -> Int {
        number1 = Int(arc4random_uniform(UInt32(number)))
        number2 = Int(arc4random_uniform(UInt32(number)))
        lbl1.text = String(number1)
        lbl2.text = String(number2)
        
        lblCalculation.text = arrCalculation[numberCalculation]
        
        switch numberCalculation {
        case 0:
            return number1 + number2
        case 1:
            return number1 - number2
        default:
            return number2 * number2
        }
    }
    
    func randomResult() {
        let calculationRight = randomCalculation()
        var calculation1: Int = Int(arc4random_uniform(7)) - 2
        while calculation1 == calculationRight {
            calculation1 = Int(arc4random_uniform(7)) - 2
        }
        var calculation2: Int = Int(arc4random_uniform(7)) - 2
        while calculation2 == calculation1 || calculation2 == calculationRight {
            calculation2 = Int(arc4random_uniform(7)) - 2
        }
        let arr: [Int] = [Int(calculation1), Int(calculation2), calculationRight]
        let temp1 = arc4random_uniform(UInt32(arr.count))
        var temp2 = arc4random_uniform(UInt32(arr.count))
        while temp2 == temp1 {
            temp2 = arc4random_uniform(UInt32(arr.count))
        }
        var temp3 = arc4random_uniform(UInt32(arr.count))
        while temp3 == temp2 || temp3 == temp1 {
            temp3 = arc4random_uniform(UInt32(arr.count))
        }
        btn1.setTitle(String(arr[Int(temp1)]), for: UIControlState.normal)
        btn2.setTitle(String(arr[Int(temp2)]), for: UIControlState.normal)
        btn3.setTitle(String(arr[Int(temp3)]), for: UIControlState.normal)
    }
}

