//
//  ViewController.swift
//  WaterFallCollectionDemo
//
//  Created by Kittitat Rodphotong on 3/22/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, normalCellDelegate {
    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Variable
    let viewModel = ViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.setupData()
        
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemInSection()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FavCell", forIndexPath: indexPath) as! FavCell
            cell.configureCell(viewModel)
            return cell
        } else {
            if viewModel.checkIsImageAtIndex(indexPath.row-1) {
                let cell = tableView.dequeueReusableCellWithIdentifier("NormalWithImageCell", forIndexPath: indexPath) as! NormalWithImageCell
                cell.delegate = self
                cell.configureCell(viewModel, index: indexPath.row-1)
                return cell
            }
            let cell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! NormalCell
            cell.delegate = self
            cell.configureCell(viewModel, index: indexPath.row-1)
            return cell
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        return UITableViewAutomaticDimension
    }
    
    // MARK: - normalCellDelegate
    func didTapFav(cell: UITableViewCell) {
        let indexPath = tableView.indexPathForCell(cell)
        if let indexP = indexPath {
            viewModel.addFavAtIndex(indexP.row-1)
            tableView.reloadData()
        }
    }
    
}

