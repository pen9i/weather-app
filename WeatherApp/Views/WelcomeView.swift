//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by eric on 18/02/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Text("Welcome to the Weather App").bold().font(.title3)
                Text("Please share your location to get the weather in your area").padding().multilineTextAlignment(.center)
                LocationButton(.shareCurrentLocation){
                    locationManager.requestLocation()
                }.cornerRadius(30).symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
