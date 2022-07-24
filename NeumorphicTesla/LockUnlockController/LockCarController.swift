//
//  ViewController.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 15.07.2022.
//

import UIKit
import CoreGraphics
import SnapKit
import AVFoundation

class LockCarController: UIViewController {
    
  
    

    @IBAction func unwindToLock(_ segue: UIStoryboardSegue){
        
    }

    @IBOutlet weak var lockView: UIView!
    let darkShadow = CALayer()
    let lightShadow = CALayer()
    
    //MARK: - BackgroundGradient
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 0.09, green: 0.094, blue: 0.102, alpha: 0.4).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
          UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            
            UIColor(red: 0.09, green: 0.094, blue: 0.102, alpha: 0.5).cgColor
        ]
   //     gradient.locations = [0.0, 0.57, 0.3, 1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
      return gradient
    }()
    
    let newColors = [
        UIColor.white.cgColor,
      UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
      UIColor(red: 0.09, green: 0.094, blue: 0.102, alpha: 1).cgColor,
        UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
    ]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
            gradient.frame = view.bounds
            view.layer.insertSublayer(gradient, at: 0)
            setupLockView()
            setupImageLockButon(text: "Unlock", image: "􀎡")
            setupSettingsButton()
            view.backgroundColor = .black
            setupGestures()

        
        
    }
    var player: AVAudioPlayer?

    func playSound() {
        guard let path = Bundle.main.path(forResource: "unlockCar", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    let carLockImage = UIImageView(image: UIImage(named: "lockCar"))
    private func setupGestures(){
        //Lock button to unlock
        let lockTap = UITapGestureRecognizer(target: self, action: #selector(unlockTapped))
        let settingsTap = UITapGestureRecognizer(target: self, action: #selector(settingTapped))
        lockView.addGestureRecognizer(lockTap)
        setUnView.addGestureRecognizer(settingsTap)
    }
    
    private func setupLockView(){
        lockView.backgroundColor = .black
        lockView.layer.cornerRadius = 40
        let gradientImage = UIImageView()
        lockView.insertSubview(gradientImage, at: 1)
        gradientImage.image = UIImage(named: "lockViewGradient")
        gradientImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
     
        view.insertSubview(carLockImage, at: 3)
        carLockImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        carLockImage.layer.shadowColor = UIColor.red.cgColor
        carLockImage.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
    }
    
    
    
    //MARK: - Settings Action
    @objc
    func settingTapped(){
        performSegue(withIdentifier: "SettingsSegue", sender: self)
    }
    
    
    //MARK: - Lock View Action
    @objc
    func unlockTapped(_ sender: UITapGestureRecognizer){
        print("lock")
        let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        whiteView.layer.cornerRadius = whiteView.frame.height/2
        whiteView.center = view.center
        whiteView.alpha = 0
        whiteView.backgroundColor = .white
        view.insertSubview(whiteView, at: 5)
        playSound()
        UIView.animate(withDuration: 0.7, delay: 0.2, options: .allowAnimatedContent) {
            whiteView.alpha = 1
            whiteView.frame = CGRect(x: 0, y: 0, width: 1200, height: 1200)
            whiteView.layer.cornerRadius = whiteView.frame.height / 2
            whiteView.center = self.view.center
        } completion: { _ in
            print("all")
            UIView.animate(withDuration: 0.3, delay: 0.2, options: .allowAnimatedContent) {
                whiteView.alpha = 0
                whiteView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                whiteView.layer.cornerRadius = whiteView.frame.height / 2
                whiteView.center = self.view.center
                self.setupUnlockView()
            } completion: { _ in
                
            }

        }


    }
    
    var carImage = UIImageView(image: UIImage(named: "Car"))
    var neonBack = UIImageView(image: UIImage(named: "neonBackground"))
    
    private func setupUnlockView(){
        gradient.removeFromSuperlayer()
       
        let gradientImage = UIImageView(image: UIImage(named: "gradientCar"))
        gradientImage.frame = self.view.frame
        self.view.insertSubview(gradientImage, at: 0)
        carLockImage.removeFromSuperview()
        roundViewImage.removeFromSuperview()
        roundButtonImage.removeFromSuperview()
        roundButtonShadow.removeFromSuperview()
        lockImage.removeFromSuperview()
        unlockLabel.removeFromSuperview()
        setupImageLockButon(text: "Lock", image: "􀎥")
        setView.removeFromSuperview()
        setImage.removeFromSuperview()
        self.view.insertSubview(carImage, at: 2)
        carImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(-15)
            make.leading.equalToSuperview()
            make.bottom.equalTo(lockView).inset(40)
            make.centerX.equalToSuperview()
        }
        lockImage.sizeToFit()
        self.view.insertSubview(neonBack, at: 1)
        neonBack.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        setupUnlockSettings()
        
        hiLabel.text = "Здравствуйте"
        hiLabel.font = UIFont.boldSystemFont(ofSize: 17)
        hiLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        self.view.insertSubview(hiLabel, at: 6)
        hiLabel.snp.makeConstraints { make in
            make.top.equalTo(setUnView).inset(125)
            make.centerX.equalToSuperview()
        }
        welcomeLabel.text = "С возвращением"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        welcomeLabel.textColor = .white
        self.view.insertSubview(welcomeLabel, at: 7)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(hiLabel).inset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    let setUnView = UIView()
    let setUnImage = UIImageView(image: UIImage(named: "UnSettings"))
    
    let hiLabel = UILabel()
    let welcomeLabel = UILabel()
    fileprivate func setupUnlockSettings(){
   
        self.view.insertSubview(setUnView, at: 5)
        setUnView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(0)
            make.height.equalTo(110)
            make.width.equalTo(200)
        }
       // setUnView.layer.cornerRadius = 25
        setUnView.backgroundColor = .clear
        
        setUnView.addSubview(setUnImage)
        setUnImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    var roundViewImage = UIView()
    var roundButtonImage = UIImageView()
    var roundButtonShadow = UIImageView(image: UIImage(named: "ShadowLock"))
    var lockImage = UIImageView(image: UIImage(named: ""))
    let unlockLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private func setupImageLockButon(text: String, image : String){
        
        roundViewImage.backgroundColor = .clear
        roundViewImage.layer.cornerRadius = 0
        self.lockView.insertSubview(roundViewImage, at: 2)
        roundViewImage.snp.makeConstraints { make in
            make.centerY.equalTo(lockView)
            make.trailing.equalTo(lockView).inset(22)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
       
        roundViewImage.isUserInteractionEnabled = true
        
        roundButtonImage.frame = self.roundViewImage.bounds
      
        roundButtonImage.image = UIImage(named: "Ellipse 837")
        
        roundViewImage.addSubview(roundButtonImage)
        roundButtonImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        roundButtonImage.isUserInteractionEnabled = true
        
        
        roundViewImage.insertSubview(roundButtonShadow, at: 3)
        
        roundButtonShadow.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(-10)
            make.leading.equalToSuperview().inset(-8)
            make.top.equalToSuperview().inset(-8)
            make.bottom.equalToSuperview().inset(-9)
        }
        
         lockImage = UIImageView(image: UIImage(named: image))
        lockView.sizeToFit()
        roundViewImage.insertSubview(lockImage, at: 4)
        if lockImage.image == UIImage(named: "􀎥"){
            lockImage.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(20)
                make.width.equalTo(20)
        }
        }else{
            self.lockImage.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(20)
                make.width.equalTo(14)
        }
        }
        
        unlockLabel.text = text
        self.lockView.insertSubview(unlockLabel, at: 5)
        unlockLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
    }
    let setView = UIView()
    let setImage = UIImageView(image: UIImage(named: "Settings"))
    private func setupSettingsButton(){
        self.view.insertSubview(setView, at: 3)
        setView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        setView.layer.cornerRadius = 25
        setView.backgroundColor = .clear
        
        setView.addSubview(setImage)
        setImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        setView.layer.shadowColor = UIColor.white.cgColor
        setView.layer.shadowRadius = 10
        setImage.layer.shadowColor = UIColor.white.cgColor
      
    }
    
    

    

}

