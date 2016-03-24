//
//  ViewModel.swift
//  InterviewDemo
//
//  Created by Kittitat Rodphotong on 3/20/2559 BE.
//  Copyright © 2559 FameSprinter. All rights reserved.
//

import Foundation

class ViewModel {
    // Variable
    var favList = [MyData]()
    var dataList = [MyData]()
    
    func setupData() {
        // Favorite
        let fav1 = MyData()
        fav1.configureData("Profile.png", detail: "Mr Pig better watch his step",
                                           image: "")
        favList.append(fav1)
        
        let fav2 = MyData()
        fav2.configureData("Profile.png", detail: "No need to get your tail in a twist or ham it up",
                                           image: "view1.jpeg")
        favList.append(fav2)
        
        let fav3 = MyData()
        fav3.configureData("Profile.png", detail: "Two years ago, we wrote a book called iOS Games by Tutorials",
                                           image: "")
        favList.append(fav3)
        
        // Normal
        let item1 = MyData()
        item1.configureData("Profile.png", detail: "This section covers the basics of making 3D games with SceneKit",
                                            image: "view1.jpeg")
        dataList.append(item1)
        
        let item2 = MyData()
        item2.configureData("Profile.png", detail: "These chapters have been heavily refactored to make use of new features",
                                            image: "")
        dataList.append(item2)
        
        let item3 = MyData()
        item3.configureData("Profile.png", detail: "Xcode include a variety of standard built in tools",
                                            image: "view1.jpeg")
        dataList.append(item3)
        
        let item4 = MyData()
        item4.configureData("Profile.png", detail: "In this section you will create stunning a make belief world",
                                            image: "")
        dataList.append(item4)
    }
    
    //return data
    func numberOfItemInSection() -> Int {
        return dataList.count+1
    }
    
    func favListCount() -> Int {
        return favList.count
    }
    
    func favAtIndex(index: Int) -> MyData {
        let item = favList[index]
        return item
    }
    
    func dataAtIndex(index: Int) -> MyData {
        let item = dataList[index]
        return item
    }
    
    func checkIsImageAtIndex(index: Int) -> Bool {
        let item = dataList[index]
        if item.image == "" {
            return false
        } else {
            return true
        }
    }
    
    func checkIsFavImageAtIndex(index: Int) -> Bool {
        let item = favList[index]
        if item.image == "" {
            return false
        } else {
            return true
        }
    }
    
    // Remove normal and Add Fav
    func addFavAtIndex(index: Int) {
        let item = dataList[index]
        favList.append(item)
        dataList.removeAtIndex(index)
        
    }
    
}