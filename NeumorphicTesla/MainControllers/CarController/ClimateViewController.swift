//
//  ClimateViewController.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 23.07.2022.
//

import UIKit
import SnapKit

class ClimateViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .clear
        setupGradient()
        setupProfileAndBackButton()
        setupProgressBar()
        setupSliderWithOther()
    }
    
   
    let profileButton = UIButton()
    let backButton = UIButton()
    
    let climateText = UILabel()
    
    
    func setupProfileAndBackButton(){
        view.insertSubview(profileButton, at: 5)
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(view).inset(30)
            make.trailing.equalTo(view).inset(0)
            make.height.equalTo(110)
            make.width.equalTo(110)
        }
        profileButton.setImage(UIImage(named: "profileButton"), for: .normal)
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        
    
        view.insertSubview(backButton, at: 5)
    backButton.snp.makeConstraints { make in
        make.top.equalTo(view).inset(30)
        make.leading.equalTo(view).inset(15)
        make.height.equalTo(110)
        make.width.equalTo(110)
    }
        
    backButton.setImage(UIImage(named: "backButton"), for: .normal)
    backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        self.view.addSubview(climateText)
        climateText.text = "CLIMATE"
        climateText.textColor = .white
        climateText.font = UIFont.boldSystemFont(ofSize: 19)
        climateText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).inset(70)
        }
   
}
    @objc func profileTapped(sender: UIButton){
        print("profile tapped")
    }
    @objc func backTapped(sender: UIButton){
        self.dismiss(animated: true)
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
        view.layer.insertSublayer(gradient, at: 0)
        
       }
    
    @IBOutlet weak var ringBar: PlainCircularProgressBar!
    let acSlider = Slider()
    
    
    let acLabel = UILabel()
    let acBuuton = UIButton()
    let imageRing = UIImageView(image: UIImage(named: "centerRing"))
    let imageBackRing = UIImageView(image: UIImage(named: "backRingImage"))
    let celLabel = UILabel()
    func setupProgressBar(){
        acSlider.minimumValue = 0
        acSlider.maximumValue = 1
        contentView.addSubview(imageBackRing)
        contentView.addSubview(imageRing)
        self.contentView.addSubview(ringBar)
        ringBar.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).inset(70)
            make.width.equalTo(220)
            make.height.equalTo(220)
        }
        
        self.contentView.addSubview(acSlider)
        acSlider.minimumValue = 0
        acSlider.maximumValue = 1
        acSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .touchUpInside)
        acSlider.isUserInteractionEnabled = false
        imageRing.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).inset(90)
            make.width.equalTo(180)
            make.height.equalTo(180)
        }
        imageBackRing.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).inset(70)
            make.width.equalTo(220)
            make.height.equalTo(220)
        }
        contentView.addSubview(celLabel)
        
        celLabel.text = "0° C"
        celLabel.font = UIFont.boldSystemFont(ofSize: 32)
        celLabel.textColor = .white
        celLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageRing)
            make.centerY.equalTo(imageRing)
        }
        let mainColor = UIColor(hexString: "2FB8FF")
        let gradient = UIColor(hexString: "9EECD9")
        ringBar.gradientColor = gradient
        ringBar.color = mainColor
        ringBar.backgroundColor = .clear
        imageRing.layer.shadowColor = UIColor.red.cgColor
        imageRing.layer.shadowOffset = CGSize(width: 10, height: 10)
        acLabel.text = "Ac"
        acSlider.tag = 0
        acLabel.textAlignment = .center
        acLabel.font = UIFont.boldSystemFont(ofSize: 17)
        acLabel.textColor = UIColor(hexString: "EBEBF5").withAlphaComponent(60)
        contentView.addSubview(acLabel)
        contentView.addSubview(acBuuton)
        acLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(40)
            make.top.equalTo(ringBar).inset(270)
        }
        acBuuton.snp.makeConstraints { make in
            make.centerY.equalTo(acLabel)
            make.leading.equalTo(acLabel).inset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        acSlider.snp.makeConstraints { make in
            make.centerY.equalTo(acBuuton)
            
            make.leading.equalTo(acBuuton).inset(72)
            make.trailing.equalTo(contentView).inset(30)
        }
        acBuuton.setImage(UIImage(named: "acButton"), for: .normal)
        acBuuton.addTarget(self, action: #selector(acGradusTapped), for: .touchUpInside)
    }
    
    
    //MARK: - Action for AC button
    
    @objc func acGradusTapped(sender: UIButton){
        acSlider.isUserInteractionEnabled = true
        fanSlider.isUserInteractionEnabled = false
        heatSlider.isUserInteractionEnabled = false
        celLabel.text = "\(Int(acSlider.value * 100))° C"
        ringBar.progress = CGFloat(acSlider.value)
        heatBuuton.setImage(UIImage(named: "unHeatButton"), for: .normal)
        fanBuuton.setImage(UIImage(named: "unFanButton"), for: .normal)
        acBuuton.setImage(UIImage(named: "acButto"), for: .normal)
    }
    @objc func fanGradusTapped(sender: UIButton){
        fanSlider.isUserInteractionEnabled = true
        acSlider.isUserInteractionEnabled = false
        heatSlider.isUserInteractionEnabled = false
        ringBar.progress = CGFloat(fanSlider.value)
        celLabel.text = "\(Int(fanSlider.value * 100))° C"
        heatBuuton.setImage(UIImage(named: "unHeatButton"), for: .normal)
        fanBuuton.setImage(UIImage(named: "fanButton"), for: .normal)
        acBuuton.setImage(UIImage(named: "acButton"), for: .normal)
    }
    @objc func heatGradusTapped(sender: UIButton){
        heatSlider.isUserInteractionEnabled = true
        fanSlider.isUserInteractionEnabled = false
        acSlider.isUserInteractionEnabled = false
        
        ringBar.progress = CGFloat(heatSlider.value)
        celLabel.text = "\(Int(heatSlider.value * 100))° C"
        heatBuuton.setImage(UIImage(named: "heatButton"), for: .normal)
        fanBuuton.setImage(UIImage(named: "unFanButton"), for: .normal)
        acBuuton.setImage(UIImage(named: "acButton"), for: .normal)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
       
        print("Slider value changed")
        
        ringBar.progress = CGFloat(sender.value)
        celLabel.text = "\(Int(sender.value * 100))° C"
        
        print("Slider step value \(sender.value)")
        
    }
    
    func setupSliderWithOther(){
        fanSlider.minimumValue = 0
        fanSlider.maximumValue = 1
        fanSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .touchUpInside)
        fanSlider.isUserInteractionEnabled = false
        fanLabel.text = "Fan"
        fanLabel.textAlignment = .center
        fanLabel.font = UIFont.boldSystemFont(ofSize: 17)
        fanLabel.textColor = UIColor(hexString: "EBEBF5").withAlphaComponent(60)
        contentView.addSubview(fanLabel)
        contentView.addSubview(fanBuuton)
        fanLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(40)
            make.top.equalTo(acLabel).inset(70)
        }
        contentView.addSubview(fanSlider)
        fanBuuton.snp.makeConstraints { make in
            make.centerY.equalTo(fanLabel)
            make.leading.equalTo(fanLabel).inset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        fanSlider.snp.makeConstraints { make in
            make.centerY.equalTo(fanBuuton)
            
            make.leading.equalTo(fanBuuton).inset(72)
            make.trailing.equalTo(contentView).inset(30)
        }
        fanBuuton.setImage(UIImage(named: "unFanButton"), for: .normal)
        fanBuuton.addTarget(self, action: #selector(fanGradusTapped), for: .touchUpInside)
        
        
        heatSlider.minimumValue = 0
        heatSlider.maximumValue = 1
        heatLabel.textAlignment = .center
        heatSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .touchUpInside)
        heatSlider.isUserInteractionEnabled = false
        heatLabel.text = "Heat"
        heatLabel.font = UIFont.boldSystemFont(ofSize: 17)
        heatLabel.textColor = UIColor(hexString: "EBEBF5").withAlphaComponent(60)
        contentView.addSubview(heatLabel)
        contentView.addSubview(heatBuuton)
        heatLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(40)
            make.top.equalTo(fanLabel).inset(70)
        }
        contentView.addSubview(heatSlider)
        heatBuuton.snp.makeConstraints { make in
            make.centerY.equalTo(heatLabel)
            make.leading.equalTo(heatLabel).inset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        heatSlider.snp.makeConstraints { make in
            make.centerY.equalTo(heatBuuton)
            
            make.leading.equalTo(heatBuuton).inset(72)
            make.trailing.equalTo(contentView).inset(30)
        }
        heatBuuton.setImage(UIImage(named: "unHeatButton"), for: .normal)
        heatBuuton.addTarget(self, action: #selector(heatGradusTapped), for: .touchUpInside)
    }
    
    let fanSlider = Slider()
    let fanLabel = UILabel()
    let fanBuuton = UIButton()
    let heatSlider = Slider()
    let heatLabel = UILabel()
    let heatBuuton = UIButton()
}
