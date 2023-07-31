//
//  OrderStatus.swift
//  OrderStatus
//
//  Created by Krithick Santhosh on 31/07/23.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct OrderStatus: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaDeliveryAttributes.self) { context in
            // MARK: Live Activity View
            
            ZStack {
                RoundedRectangle(cornerRadius: 15,style: .continuous)
                    .fill(Color("Green").gradient)
            }
            LockScreenLiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                            Label("\(context.attributes.numberOfPizzas) Pizzas", systemImage: "bag")
                                .foregroundColor(.indigo)
                                .font(.title2)
                        }
                                
                        DynamicIslandExpandedRegion(.trailing) {
                            Label {
                                Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 50)
                                    .monospacedDigit()
                            } icon: {
                                Image(systemName: "timer")
                                    .foregroundColor(.indigo)
                            }
                            .font(.title2)
                        }
                                
                        DynamicIslandExpandedRegion(.center) {
                            Text("\(context.state.driverName) is on their way!")
                                .lineLimit(1)
                                .font(.caption)
                        }
                                
                        DynamicIslandExpandedRegion(.bottom) {
                            Button {
                                // Deep link into your app.
                            } label: {
                                Label("Call driver", systemImage: "phone")
                            }
                            .foregroundColor(.indigo)
                        }
                } compactLeading: {
                    Label {
                        Text("\(context.attributes.numberOfPizzas) Pizzas")
                    } icon: {
                        Image(systemName: "bag")
                            .foregroundColor(.indigo)
                    }
                    .font(.caption2)
                } compactTrailing: {
                    Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 40)
                        .font(.caption2)
                } minimal: {
                    VStack(alignment: .center) {
                        Image(systemName: "timer")
                        Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                            .multilineTextAlignment(.center)
                            .monospacedDigit()
                            .font(.caption2)
                    }
                }
                .keylineTint(.cyan)
        }
    }
}
