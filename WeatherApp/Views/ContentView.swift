//
//  ContentView.swift
//  WeatherApp
//
//  Created by eric on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(latitute: location.latitude, longitute: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.627, saturation: 0.806, brightness: 0.232))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
