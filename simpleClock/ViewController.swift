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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        simpleClokView.center = view.center
        simpleClokView.layer.borderWidth = 2
        simpleClokView.layer.borderColor = UIColor.black.cgColor
       
        simpleClokView.layer.cornerRadius = simpleClokView.frame.size.height / 2
      
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
    }
}



