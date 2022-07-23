//
//  OptionTableViewCell.swift
//  NeumorphicTesla
//
//  Created by Владимир Никитин on 18.07.2022.
//

import UIKit
import SnapKit
class OptionTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var opinImage: UIImageView!
    
    @IBOutlet weak var opinTitle: UILabel!
    
    @IBOutlet weak var row: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        

        opinTitle.font = UIFont.boldSystemFont(ofSize: 20)
        opinTitle.textColor = UIColor(hexString: "#EBEBF5").withAlphaComponent(0.6)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }

}
