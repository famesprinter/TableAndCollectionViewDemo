//
//  NormalWithImgCLTCell.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/24/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

class NormalWithImgCLTCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCLTCell(pImg: String, detail: String, image: String){
        proImg.image = UIImage(named: pImg)
        label.text = detail
        img.image = UIImage(named: image)
    }

}
