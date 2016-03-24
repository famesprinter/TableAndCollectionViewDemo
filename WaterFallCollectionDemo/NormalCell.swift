//
//  NormalCell.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/22/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

protocol normalCellDelegate: class {
    func didTapFav(cell :UITableViewCell)
}

class NormalCell: UITableViewCell {
    // IBOutlet
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    weak var delegate: normalCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(viewModel:ViewModel, index: Int) {
        let item = viewModel.dataAtIndex(index)
        proImg.image = UIImage(named: item.proImg)
        detailLabel.text = item.detail
    }
    
    @IBAction func favTap() {
        delegate?.didTapFav(self)
    }

}
