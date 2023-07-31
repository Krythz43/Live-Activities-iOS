//
//  ContentView.swift
//  LiveActivities
//
//  Created by Krithick Santhosh on 31/07/23.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Start Live Activity") {
                startActivity()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func startActivity() {
    var minutes = 7
    var seconds = 6
    // Sets live activity timer for 7 minutes and 6 seconds
    
    if ActivityAuthorizationInfo().areActivitiesEnabled {
        var future = Calendar.current.date(byAdding: .minute, value: (Int(minutes) ?? 0), to: Date())!
        future = Calendar.current.date(byAdding: .second, value: (Int(seconds) ?? 0), to: future)!
        let date = Date.now...future
        let initialContentState = PizzaDeliveryAttributes.ContentState(driverName: "Bill James", deliveryTimer:date)
        let activityAttributes = PizzaDeliveryAttributes(numberOfPizzas: 3, totalAmount: "$42.00", orderNumber: "12345")
        
        let activityContent = ActivityContent(state: initialContentState, staleDate: Calendar.current.date(byAdding: .minute, value: 30, to: Date())!)
        
        do {
            let deliveryActivity = try Activity.request(attributes: activityAttributes, content: activityContent)
            print("Requested a pizza delivery Live Activity \(String(describing: deliveryActivity.id)).")
        } catch (let error) {
            print("Error requesting pizza delivery Live Activity \(error.localizedDescription).")
        }
    }
}
