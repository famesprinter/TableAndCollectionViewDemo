//
//  NormalCLTCell.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/23/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

class NormalCLTCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var proImg: UIImageView!
    
    var isHeightCalculated: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCLTCell(pImg: String, detail: String){
        proImg.image = UIImage(named: pImg)
        label.text = detail
    }

}
