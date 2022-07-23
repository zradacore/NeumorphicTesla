//
//  ChargeViewController.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 17.07.2022.
//

import UIKit

class ChargeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
    }
    

    func setupGradient(){
      
        let gradient = CAGradientLayer()
        gradient.colors = [
          UIColor(red: 0.165, green: 0.175, blue: 0.196, alpha: 1).cgColor,
          UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1).cgColor
        ]
        gradient.locations = [0, 0.99]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0))
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        gradient.position = view.center
        view.layer.addSublayer(gradient)
       }

}
