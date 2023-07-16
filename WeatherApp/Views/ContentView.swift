//
//  ContentView.swift
//  WeatherApp
//
//  Created by Rahul Gupta on 16/07/23.
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
                    Text("Weather data fetched!")
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(
                                    latitude: location.latitude, longitude: location.longitude
                                )
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if (locationManager.isLoading) {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }.modifier(BackgroundWrapper())
    }
}


struct BackgroundWrapper: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
