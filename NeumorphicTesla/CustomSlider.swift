//
//  CustomSlider.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 23.07.2022.
//

import Foundation
import UIKit

final class Slider: UISlider {

    private let baseLayer = CALayer() // Step 3
    private let trackLayer = CAGradientLayer() // Step 7
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }

    private func setup() {
        clear()
        createBaseLayer() // Step 3
        createThumbImageView() // Step 5
        configureTrackLayer() // Step 7
        addUserInteractions() // Step 8
        //createThumbImageView()
    }

    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }

    // Step 3
    let testView = UIView()
    let imageView = UIImageView(image: UIImage(named: "baseSlider"))
    private func createBaseLayer() {
     //   imageView.layer.borderWidth = 1
       // imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.masksToBounds = true
        //testView.backgroundColor = UIColor.white.cgColor
        imageView.frame = .init(x: 0, y: frame.height / 11, width: frame.width, height: frame.height / 2)
        imageView.layer.cornerRadius = imageView.frame.height / 2
        self.insertSubview(imageView, at: 0)
        
    }

    // Step 7
    private func configureTrackLayer() {
        let firstColor = UIColor(hexString: "2FB8FF").cgColor
        let secondColor = UIColor(hexString: "9EECD9").cgColor
        trackLayer.colors = [firstColor, secondColor]
        trackLayer.startPoint = .init(x: 0, y: 0.5)
        trackLayer.endPoint = .init(x: 1, y: 0.5)
        trackLayer.frame = .init(x: 0,
                                    y: frame.height / 20,
                                    width: 0,
                                    height: frame.height / 2)
        trackLayer.cornerRadius = 4
        imageView.layer.insertSublayer(trackLayer, at: 1)
    }

    // Step 8
    private func addUserInteractions() {
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }

    @objc private func valueChanged(_ sender: Slider) {
        // Step 10
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        // Step 9
        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        trackLayer.frame = .init(x: 0, y: frame.height / 7, width: thumbRectA.midX, height: imageView.frame.height - 5)
        // Step 10
        CATransaction.commit()
    }

    // Step 5
    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 4
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: thumbSize + 4, height: thumbSize - 4))
        imageView.layer.cornerRadius = thumbSize / 2
        imageView.image = UIImage(named: "thumbSlider")
        let thumbSnapshot = imageView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        // Step 6
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
        
    }
}

// Step 4
final class ThumbView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
//        backgroundColor = UIColor(red: 183 / 255, green: 122 / 255, blue: 231 / 255, alpha: 1)
//               let middleView = UIView(frame: .init(x: frame.midX - 6,
//                                                    y: frame.midY - 6,
//                                                    width: 12,
//                                                    height: 12))
//               middleView.backgroundColor = .white
//               middleView.layer.cornerRadius = 6
//               addSubview(middleView)
    }
}

// Step 4
extension UIImageView {

    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let capturedImage = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return capturedImage
    }
}
