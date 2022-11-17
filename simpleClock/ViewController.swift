//
//  ViewController.swift
//  simpleClock
//
//  Created by viktor on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var simpleClokView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // someCode
        simpleClokView.center = view.center
        simpleClokView.layer.borderWidth = 2
        simpleClokView.layer.borderColor = UIColor.black.cgColor
        simpleClokView.layer.cornerRadius = simpleClokView.frame.size.height / 2
        
    }


}

