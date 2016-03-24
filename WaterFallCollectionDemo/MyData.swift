//
//  MyData.swift
//  InterviewDemo
//
//  Created by Kittitat Rodphotong on 3/20/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import Foundation

class MyData {
    var proImg: String = ""
    var detail: String = ""
    var image: String = ""
    
    func configureData(proImg: String,
                       detail: String,
                        image: String) {
        self.proImg = proImg
        self.detail = detail
        self.image = image
    }
}