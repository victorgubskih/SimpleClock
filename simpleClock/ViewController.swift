//
//  ViewController.swift
//  simpleClock
//
//  Created by viktor on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var simpleClokView: UIView!
    
   @IBOutlet weak var handClock: UIView!
   
    @IBOutlet weak var handClockMinute: UIView!
   
    @IBOutlet weak var nameClockSeconds: UIView!
    var dataPicker = UIDatePicker()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleClokView.translatesAutoresizingMaskIntoConstraints = false
        
        simpleClokView.center = view.center
        simpleClokView.layer.borderWidth = 2
        simpleClokView.layer.borderColor = UIColor.black.cgColor
       
        simpleClokView.layer.cornerRadius = simpleClokView.frame.size.height / 2
       
       
        dataPicker.frame = CGRect(x: 0, y: 40, width: 200, height: 50)
        dataPicker.center.x = simpleClokView.center.x
        dataPicker.preferredDatePickerStyle = .compact
        dataPicker.datePickerMode = .time 
        view.addSubview(dataPicker)
      
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
       /* movHourClock(hourCount: 5)
        movMinutesClock(minutesCount: 30)
        movSecondsClock(secondsCount: 45)*/
        
        movenmetOfThreeHands(count: 12, index: 10, handView: handClock)
        movenmetOfThreeHands(count: 60, index: 15, handView: handClockMinute)
        movenmetOfThreeHands(count: 60, index: 35, handView: nameClockSeconds)
        
    }
   /* func movHourClock(hourCount: Int) {
        let count1 = 12
        let step = CGFloat(2 * Double.pi) / CGFloat(count1)
        let x = handClock.bounds.width / 4
        let y = handClock.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(hourCount) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handClock.transform = transform
    }
    func movMinutesClock(minutesCount: Int) {
        let count2 = 60
        let step = CGFloat(2 * Double.pi) / CGFloat(count2)
        let x = handClockMinute.bounds.width / 4
        let y = handClockMinute.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(minutesCount) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handClockMinute.transform = transform
    }
    
    func movSecondsClock(secondsCount: Int) {
        let count3 = 60
        let step = CGFloat(2 * Double.pi) / CGFloat(count3)
        let x = nameClockSeconds.bounds.width / 4
        let y = nameClockSeconds.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(secondsCount) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        nameClockSeconds.transform = transform
    } */
    
    func movenmetOfThreeHands(count: Int, index: Int, handView: UIView) {
       
        let step = CGFloat(2 * Double.pi) / CGFloat(count)
        let x = handView.bounds.width / 4
        let y = handView.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(index) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handView.transform = transform
    }
    
}



