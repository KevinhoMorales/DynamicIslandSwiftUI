//
//  DeliveryStatus.swift
//  DynamicIslandSwiftUI
//
//  Created by Kevinho Morales on 11/2/24.
//

import Foundation

enum DeliveryStatus: String, Codable {
    case pending = "PENDIENTE"
    case sent = "ENVIADO"
    case inTransit = "EN REPARTO"
    case deliviered = "ENTREGADO"
}
