//
//  CustomTabBarVc.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 17.07.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomTabBarVC : UITabBarController, UITabBarControllerDelegate{
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    let blurView = UIImageView(image: UIImage(named: "blur"))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 0
        setupMiddeleButtn()
        let app = UITabBarAppearance()
              app.backgroundEffect = .none
              app.shadowColor = .clear
              tabBar.standardAppearance = app
       self.tabBar.insertSubview(blurView, at: 3)
        self.tabBar.backgroundColor = .red.withAlphaComponent(0)
        
 
         self.tabBar.autoresizesSubviews = false

        let bgView: UIImageView = UIImageView(image: UIImage(named: "tabBar"))
        bgView.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width , height: 85)
        
        self.tabBar.insertSubview(blurView, at: 3)
        let x = self.view.frame.width / 5
        self.blurView.frame = CGRect(x: x - x + 5, y: -5, width: 70, height: 70)
        self.tabBar.insertSubview(bgView, at: 1)
        self.tabBar.items?.first?.image = UIImage(named: "carItem")?.withRenderingMode(.alwaysTemplate)
        self.tabBar.items![1].image = UIImage(named: "chargeItem")?.withRenderingMode(.alwaysTemplate)
        self.tabBar.items![3].image = UIImage(named: "placeItem")?.withRenderingMode(.alwaysTemplate)
        self.tabBar.items![4].image = UIImage(named: "profileItem")?.withRenderingMode(.alwaysTemplate)
        self.tabBar.tintColor = UIColor(hexString: "2FB8FF")
       // self.tabBar.backgroundImage = UIImage(named: "tabBar")
      //  selectTabBar(index: 3)
       
    }
    
 
 
    
    func setupMiddeleButtn(){
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width/2) - 30, y: -40, width: 60, height: 60))
        
        middleButton.setBackgroundImage(UIImage(named: "plusMiddleButton"), for: .normal)
        self.tabBar.insertSubview(middleButton, at: 2)
        middleButton.addTarget(self, action: #selector(addButtonAction(sender:)), for: .touchUpInside)
        self.view.layoutIfNeeded()
        
    }
    
    @objc func addButtonAction(sender : UIButton){
        self.selectedIndex = 2
      
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let x = self.view.frame.width / 5
        print(x)
        
        if tabBar.selectedItem == tabBar.items?.first{
        UIView.animate(withDuration: 1) {
            
            self.blurView.isHidden = false
            self.blurView.frame = CGRect(x: x - x + 5, y: -5, width: 70, height: 70)
        }
        }
        if tabBar.selectedItem == tabBar.items![1]{
            print("yes")
        UIView.animate(withDuration: 1) {
            self.blurView.isHidden = false
            self.blurView.frame = CGRect(x: x + 5, y: -5, width: 70, height: 70)
        }
        }
        if tabBar.selectedItem == tabBar.items![2]{
        UIView.animate(withDuration: 1) {
            self.blurView.isHidden = false
            self.blurView.frame = CGRect(x: (x * 2) + 5, y: -30, width: 70, height: 70)
        }completion: { _ in
            self.blurView.isHidden = true
        }
        }
        if tabBar.selectedItem == tabBar.items![3]{
            
        UIView.animate(withDuration: 1) {
            self.blurView.isHidden = false
            self.blurView.frame = CGRect(x: (x * 3) + 5, y: -5, width: 70, height: 70)
        }
        }
        if tabBar.selectedItem == tabBar.items![4]{
        UIView.animate(withDuration: 1) {
            self.blurView.isHidden = false
            self.blurView.frame = CGRect(x: (x * 4)+5, y: -5, width: 70, height: 70)
        }
        }
            
    }
}

