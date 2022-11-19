//
//  ViewController.swift
//  simpleClock
//
//  Created by viktor on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var simpleClokView: UIView!
    
   
    @IBOutlet weak var twelfLabel: UILabel!
    
    @IBOutlet weak var nineLabel: UILabel!
    
    @IBOutlet weak var sixLabel: UILabel!
    
    @IBOutlet weak var threeLabel: UILabel!
    
    @IBOutlet weak var centerLabel: UILabel!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // someCode
        //centerLabel.center = simpleClokView.center
        simpleClokView.center = view.center
        simpleClokView.layer.borderWidth = 2
        simpleClokView.layer.borderColor = UIColor.black.cgColor
       
        
        
        simpleClokView.layer.cornerRadius = simpleClokView.frame.size.height / 2
       
        twelfLabel.frame.origin.y = 5
        twelfLabel.center.x = simpleClokView.frame.size.width / 2
        
        
        sixLabel.frame.origin.y = simpleClokView.frame.height - sixLabel.frame.height - 5
        sixLabel.center.x = simpleClokView.frame.size.width / 2
        
        nineLabel.frame.origin.x = 0
        nineLabel.center.y = simpleClokView.frame.size.height / 2
        
        threeLabel.frame.origin.x = simpleClokView.frame.width - threeLabel.frame.width
        threeLabel.center.y = simpleClokView.frame.size.height / 2
    }

}

