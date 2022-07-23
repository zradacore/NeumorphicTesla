//
//  TabBarVC.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 17.07.2022.
//

import UIKit



//class TabBarVC: UITabBar {
//
//    private var shapeLayer : CALayer?
//
//    private func addShape(){
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = createPath()
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.fillColor = UIColor.gray.cgColor
//        shapeLayer.lineWidth = 1
//        if let oldShapeLayer = self.shapeLayer{
//            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
//        }else{
//            self.layer.insertSublayer(shapeLayer, at: 0)
//        }
//        self.shapeLayer = shapeLayer
//    }
//    
//    override func draw(_ rect: CGRect) {
//        self.addShape()
//        self.unselectedItemTintColor = UIColor(hexString: "EBEBF5").withAlphaComponent(0.6)
//        self.tintColor = UIColor(hexString: "EBEBF5").withAlphaComponent(0.6)
//        
//    //   self.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
//    //    self.backgroundColor = .red
//    }
//    
//    
//    func createPath() -> CGPath{
//        let height : CGFloat = 75
//        let path = UIBezierPath()
//        let centerWidth = self.frame.width / 2
//        
//        path.move(to: CGPoint(x: 0, y: 40))
//        //path.addQuadCurve(to: CGPoint(x: self.frame.width, y: 0), controlPoint: CGPoint(x: centerWidth, y: height))
//        //path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
//        path.addLine(to: CGPoint(x: 40, y: 75))
//        path.close()
//        
//        
//        return path.cgPath
//    }
//    
//}
