//
//  ViewController.swift
//  simpleClock
//
//  Created by viktor on 17.11.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var simpleClokView: UIView!
    
   @IBOutlet weak var handClock: UIView!
   
    @IBOutlet weak var handClockMinute: UIView!
   
    @IBOutlet weak var nameClockSeconds: UIView!
  
    var datePicker = UIDatePicker()
    var timer = Timer()
    var timer1 = Timer()
    var second = 0
    var minute = 0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleClokView.translatesAutoresizingMaskIntoConstraints = false
        
        simpleClokView.center = view.center
        simpleClokView.layer.borderWidth = 2
        simpleClokView.layer.borderColor = UIColor.black.cgColor
       
        simpleClokView.layer.cornerRadius = simpleClokView.frame.size.height / 2
       
       
        datePicker.frame = CGRect(x: 0, y: 40, width: 200, height: 50)
        datePicker.center.x = simpleClokView.center.x
        datePicker.center.y = simpleClokView.center.y
        
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .time 
        view.addSubview(datePicker)
        
        datePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timer1 = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timerAction1), userInfo: nil, repeats: true)
        
        
        createObjectsAroundCircle()
    }
    
    func createObjectsAroundCircle() {

        let center = CGPoint(x: simpleClokView.bounds.width/2 ,y: simpleClokView.bounds.height/2)
        
        let radius : CGFloat = 100
        let count = 12

        var angle = CGFloat(2 * Double.pi - Double.pi / 3)
        let step = CGFloat(2 * Double.pi) / CGFloat(count)

        for  index in  0..<count {
            
            let x = cos(angle) * radius + center.x
            let y = sin(angle) * radius + center.y
        

            let label = UILabel()
            label.text = "\(index + 1)"
           
            label.font = UIFont(name: "Arial", size: 20)
            label.textColor = UIColor.black
            label.sizeToFit()
            
            label.center = CGPoint(x: x, y: y)
            
            simpleClokView.addSubview(label)
            angle += step
        }
      
        
        movenmetOfThreeHands(count: 12, index: 1, handView: handClock)
        movenmetOfThreeHands(count: 60, index: minute, handView: handClockMinute)
        movenmetOfThreeHands(count: 60, index: second, handView: nameClockSeconds)
        
    }
 
    func movenmetOfThreeHands(count: Int, index: Int, handView: UIView) {
       
        let step = CGFloat(2 * Double.pi) / CGFloat(count)
        let x = handView.bounds.width / 4
        let y = handView.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(index) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handView.transform = transform
    }
    
    @objc func timeChanged(_ datePicker: UIDatePicker) {
        let date = datePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        movenmetOfThreeHands(count: 12, index: components.hour ?? 0, handView: handClock)
        movenmetOfThreeHands(count: 60, index: components.minute ?? 0, handView: handClockMinute)
        movenmetOfThreeHands(count: 60, index: components.second ?? 0, handView: nameClockSeconds)
    }
    @objc func timerAction(){
        second += 1
        movenmetOfThreeHands(count: 60, index: second, handView: nameClockSeconds)
    }
    @objc func timerAction1(){
    minute += 1
    movenmetOfThreeHands(count: 60, index: minute, handView: handClockMinute)
    }
}



