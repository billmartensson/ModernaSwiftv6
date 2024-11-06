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
