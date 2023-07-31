//
//  OrderAttributes.swift
//  LiveActivities
//
//  Created by Krithick Santhosh on 31/07/23.
//

import SwiftUI
import ActivityKit

struct PizzaDeliveryAttributes: ActivityAttributes {
    public typealias PizzaDeliveryStatus = ContentState


    public struct ContentState: Codable, Hashable {
        var driverName: String
        var deliveryTimer: ClosedRange<Date>
    }


    var numberOfPizzas: Int
    var totalAmount: String
    var orderNumber: String
}
