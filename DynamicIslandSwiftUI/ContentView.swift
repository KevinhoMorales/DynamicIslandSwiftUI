//
//  ContentView.swift
//  DynamicIslandSwiftUI
//
//  Created by Kevinho Morales on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var productName = "Camiseta $49.99"
    @State var currentDeliveryState: DeliveryStatus = .pending
    // Actividad que se esta mostrando dentro de nuestra Dynamic Island
    @State var activityId = ""
    
    var body: some View {
        VStack {
            Text(productName)
                .font(.system(size: 28, weight: .bold))
                .padding(.bottom, 32)
            Image(systemName: "tshirt.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("ESTADO \(currentDeliveryState.rawValue)")
                .font(.system(.body))
            Button {
                buyProduct()
            } label: {
                Label("COMPRAR", systemImage: "cart.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .padding(.top, 32)
            .frame(maxWidth: .infinity)
            Spacer()
            Button {
                changeState()
            } label: {
                Label("CAMBIAR ESTADO PRODUCTO", systemImage: "arrow.clockwise.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .padding(.top, 32)
            .frame(maxWidth: .infinity)
            
            Button {
                removeState()
            } label: {
                Label("ELIMINAR PRODUCTO", systemImage: "cart.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding(.top, 32)
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding()
    }
    
    private func buyProduct() {
        currentDeliveryState = .sent
        do {
            activityId = try DeliveryActivityUseCase.startActivity(deliveryStatus: currentDeliveryState, productName: productName, eta: "09:30 PM")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func changeState() {
        currentDeliveryState = .inTransit
        Task {
            await DeliveryActivityUseCase.updateActivity(activityId: activityId, newDeliveryStatus: currentDeliveryState, productName: productName, eta: "09:30 PM")
        }
    }
    
    private func removeState() {
        currentDeliveryState = .deliviered
        Task {
            await DeliveryActivityUseCase.endActivity(activityId: activityId)
        }
    }
}

#Preview {
    ContentView()
}
