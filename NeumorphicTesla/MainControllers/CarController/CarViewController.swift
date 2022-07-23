//
//  CarViewController.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 17.07.2022.
//

import UIKit
import SnapKit

class CarViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradient()
        createLeftLabel()
        setupProfileButton()
        setupCarImage()
        setupHorizontalActionView()
        setupTableView()
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
    
    let teslaLabel : UILabel = {
       let tesla = UILabel()
        tesla.text = "Tesla"
        tesla.font = UIFont.boldSystemFont(ofSize: 28)
        tesla.textColor = .white
        return tesla
    }()
    let batteryImageView = UIImageView(image: UIImage(named: "battery"))
    
    func createLeftLabel(){
        contentView.insertSubview(teslaLabel, at: 1)
        contentView.insertSubview(batteryImageView, at: 1)
        teslaLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(25)
            make.leading.equalTo(contentView).inset(30)
        }
        batteryImageView.snp.makeConstraints { make in
            make.top.equalTo(teslaLabel).inset(40)
            make.leading.equalTo(contentView).inset(33)
        }
    }
    
    let profileButton = UIButton()
    
    func setupProfileButton(){
        contentView.insertSubview(profileButton, at: 2)
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(-5)
            make.trailing.equalTo(contentView).inset(0)
            make.height.equalTo(110)
            make.width.equalTo(110)
        }
        profileButton.setImage(UIImage(named: "profileButton"), for: .normal)
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    @objc func profileTapped(sender: UIButton){
        print("profile tapped")
    }
    
    let carImageView = UIImageView(image: UIImage(named: "carMain"))
    
    func setupCarImage(){
        self.contentView.insertSubview(carImageView, at: 2)
        carImageView.snp.makeConstraints { make in
            make.top.equalTo(batteryImageView).inset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(254)
        }
    }
    
    let actionHorView = UIView()
    let darkShadow : CALayer = {
        let darkShadow = CALayer()
        darkShadow.shadowColor = UIColor.black.cgColor
        darkShadow.shadowOffset = CGSize(width: 10, height: 0)
        darkShadow.shadowOpacity = 1
        darkShadow.shadowRadius = 50
      
        return darkShadow
    }()
    var whiteShadow = CALayer()
    let stackView = UIStackView()
    let lockButton = UIButton()
    let climateButton = UIButton()
    let chargeButton = UIButton()
    let openButton = UIButton()
    func setupHorizontalActionView(){
        contentView.insertSubview(actionHorView, at: 3)
        actionHorView.snp.makeConstraints { make in
            make.top.equalTo(carImageView).inset(235)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(30)
            make.height.equalTo(104)
        }
        actionHorView.layer.cornerRadius = 50
        actionHorView.backgroundColor = UIColor(red: 0.153, green: 0.157, blue: 0.165, alpha: 1)
        actionHorView.translatesAutoresizingMaskIntoConstraints = false
        
        actionHorView.layer.insertSublayer(whiteShadow, at: 0)
        whiteShadow.masksToBounds = false
        whiteShadow.shadowColor = UIColor.white.cgColor
        whiteShadow.shadowOpacity = 1
        whiteShadow.shadowOffset = CGSize(width: -10, height: -5)
        whiteShadow.shadowRadius = 5
        whiteShadow.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.actionHorView.frame.width, height: 30)).cgPath
        whiteShadow.shouldRasterize = true
        whiteShadow.rasterizationScale = true ? UIScreen.main.scale : 1
        whiteShadow.frame = actionHorView.bounds
        openButton.setImage(UIImage(named: "open"), for: .normal)
        lockButton.setImage(UIImage(named: "lock"), for: .normal)
        chargeButton.setImage(UIImage(named: "charge"), for: .normal)
        climateButton.setImage(UIImage(named: "climate"), for: .normal)
        openButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        lockButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        chargeButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        climateButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        actionHorView.insertSubview(stackView, at: 3)
       
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(actionHorView).inset(30)
            make.trailing.equalTo(actionHorView).inset(30)
            make.top.equalTo(actionHorView).inset(20)
            make.bottom.equalTo(actionHorView).inset(20)
            make.height.equalTo(44)
        }
        stackView.addArrangedSubview(lockButton)
        stackView.addArrangedSubview(climateButton)
        stackView.addArrangedSubview(chargeButton)
        stackView.addArrangedSubview(openButton)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 84
        tableView.backgroundColor = .clear
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(actionHorView).inset(120)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(300)
        }
        tableView.layer.cornerRadius = 40
        let view = UIView(frame: tableView.bounds)
        view.backgroundColor = .clear
        let image = UIImageView(image: UIImage(named: "backGroundTableView"))
        view.addSubview(image)
        image.frame = view.frame
        tableView.layer.shadowOffset = CGSize(width: 10, height: 10)
        tableView.layer.shadowRadius = 10
        tableView.layer.shadowColor = UIColor.white.cgColor
        
        
        
    }
    
    // Array of struct for Table View
   let options = [Options(image: "opCar", title: "Control", row: "arrow"),
                  Options(image: "climate", title: "Climate", row: "arrow"),
                     Options(image: "opCar", title: "Location", row: "arrow")]
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
   
    

  
    

    
}
struct Options{
    var image : String
    var title : String
    var row : String
    
}

extension CarViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OptionTableViewCell
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
     //   cell.inputView?.backgroundColor = .clear
        let option = options[indexPath.row]
        print(option.title)
        cell.opinImage.image = UIImage(named: option.image)?.withRenderingMode(.alwaysOriginal)
        cell.opinTitle.text = option.title
        cell.row.image = UIImage(named: option.row)?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    
}
