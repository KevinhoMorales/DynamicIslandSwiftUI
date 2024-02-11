//
//  DeliveryAttributes.swift
//  DynamicIslandSwiftUI
//
//  Created by Kevinho Morales on 11/2/24.
//

import Foundation
import ActivityKit

struct DeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var deliveryStatus: DeliveryStatus
        var productName: String
        var eta: String
    }
}
