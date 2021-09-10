//
//  Data.swift
//  TestTableView
//
//  Created by Thenny Chhorn on 9/9/21.
//

import UIKit

//Data structure

class Data {
    
    var selectSegment: Int?
    var text: String
    var date: Date
    
    init(date: Date, text: String){
        self.text = text
        self.date = date
    }
}

var titleArray = ["Surrounding Areas/Adjacent Activites", "Building Grounds","Building Structure", "Water System","Other"]

var datas = [Data]()
