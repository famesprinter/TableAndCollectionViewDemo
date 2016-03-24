//
//  NormalWithImageCell.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/22/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

class NormalWithImageCell: UITableViewCell {
    // IBOutlet
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    weak var delegate: normalCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(viewModel:ViewModel, index: Int) {
        let item = viewModel.dataAtIndex(index)
        proImg.image = UIImage(named: item.proImg)
        detailLabel.text = item.detail
        myImage.image = UIImage(named: item.image)
    }
    
    @IBAction func favTap() {
        delegate?.didTapFav(self)
    }
}
