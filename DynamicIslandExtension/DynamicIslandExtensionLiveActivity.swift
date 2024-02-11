//
//  DynamicIslandExtensionLiveActivity.swift
//  DynamicIslandExtension
//
//  Created by Kevinho Morales on 11/2/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

@main
struct DynamicIslandExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DeliveryAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                Image(systemName: "truck.box.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .padding(.leading, 22)
                VStack(alignment: .leading) {
                    Text(context.state.productName)
                        .bold()
                    + Text(" está ")
                    + Text(context.state.deliveryStatus.rawValue)
                        .bold()
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Hora de entrega")
                    Text(context.state.eta)
                        .bold()
                }
                .padding(.trailing, 12)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "truck.box.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(.leading, 12)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.productName)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("ESTADO \(context.state.deliveryStatus.rawValue)")
                        .bold()
                        .multilineTextAlignment(.center)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Button {
                        print("Pedido cancelado")
                    } label: {
                        Label("CANCELAR PEDIDO", systemImage: "xmark.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            } compactLeading: {
                HStack {
                    Image(systemName: "truck.box.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                    Text(context.state.productName)
                }
            } compactTrailing: {
                Text(context.state.deliveryStatus.rawValue)
            } minimal: {
                Image(systemName: "truck.box.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }

        }
    }
}

//extension DynamicIslandExtensionAttributes {
//    fileprivate static var preview: DynamicIslandExtensionAttributes {
//        DynamicIslandExtensionAttributes(name: "World")
//    }
//}
//
//extension DynamicIslandExtensionAttributes.ContentState {
//    fileprivate static var smiley: DynamicIslandExtensionAttributes.ContentState {
//        DynamicIslandExtensionAttributes.ContentState(emoji: "😀")
//     }
//     
//     fileprivate static var starEyes: DynamicIslandExtensionAttributes.ContentState {
//         DynamicIslandExtensionAttributes.ContentState(emoji: "🤩")
//     }
//}

#Preview("Notification", as: .content, using: DeliveryAttributes()) {
   DynamicIslandExtensionLiveActivity()
} contentStates: {
    DeliveryAttributes.ContentState.init(deliveryStatus: .pending, 
                                         productName: "Camiseta L",
                                         eta: "09:00 PM")
}
