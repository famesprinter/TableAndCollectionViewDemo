//
//  FavCell.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/22/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

class FavCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewWaterfallLayoutDelegate {
    var collectionView: UICollectionView!
    var cellHeight: [CGFloat] = []
    var proImg: [String] = []
    var detail: [String] = []
    var img: [String] = []
    var count: Int = 0
    var viewModel: ViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    // MARK: - Configure Cell
    func configureCell(viewModel: ViewModel) {
        clearArr()
        count = viewModel.favListCount()
        for index in 0...count-1 {
            let item = viewModel.favAtIndex(index)
            let font = UIFont(name: "Helvetica Neue", size: 17)!
            let rect = NSString(string: item.detail).boundingRectWithSize(CGSize(width: self.bounds.width/6, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
            cellHeight.append(ceil(rect.height))
            proImg.append(item.proImg)
            detail.append(item.detail)
            img.append(item.image)
        }
        
        
        // Create CollectionView
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.headerHeight = 8
        layout.footerHeight = 8
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: CGRect(x: 0.0,
                                                        y: 0.0,
                                                    width: UIScreen.mainScreen().bounds.width,
                                                   height: 300), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(UINib.init(nibName: "NormalCLTCell", bundle: nil), forCellWithReuseIdentifier: "NormalCLTCell")
        collectionView.registerNib(UINib.init(nibName: "NormalWithImgCLTCell", bundle: nil), forCellWithReuseIdentifier: "NormalWithImgCLTCell")
        collectionView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        addSubview(collectionView)
    }
    
    // MARK: - Clear Data
    func clearArr() {
        cellHeight.removeAll()
        proImg.removeAll()
        detail.removeAll()
        img.removeAll()
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if img[indexPath.row] == "" {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NormalCLTCell", forIndexPath: indexPath) as! NormalCLTCell
            cell.configureCLTCell(proImg[indexPath.row], detail: detail[indexPath.row])
            return cell
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NormalWithImgCLTCell", forIndexPath: indexPath) as! NormalWithImgCLTCell
        cell.configureCLTCell(proImg[indexPath.row], detail: detail[indexPath.row], image: img[indexPath.row])
        return cell
    }
    
    // MARK: WaterfallLayoutDelegate
    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if img[indexPath.row] == "" {
            return CGSize(width: self.bounds.width/2, height: cellHeight[indexPath.row])
        }
        return CGSize(width: self.bounds.width/2, height: cellHeight[indexPath.row]+100)
    }
}