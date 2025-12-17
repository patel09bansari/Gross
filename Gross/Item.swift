//
//  ListModel.swift
//  TODoAPP
//
//  Created by Yagnikk on 12/4/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}


