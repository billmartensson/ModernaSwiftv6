//
//  Item.swift
//  ModernaSwiftv6
//
//  Created by BillU on 2024-11-06.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}


@Model
final class ShopThing {
    
    var name : String
    var amount : Int
    var bought : Bool

    
    init(name: String, amount : Int, bought : Bool) {
        self.name = name
        self.amount = amount
        self.bought = bought
    }
}
