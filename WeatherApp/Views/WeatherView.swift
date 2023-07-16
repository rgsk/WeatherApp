//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack  {
                VStack (alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
      
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName:"sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        Spacer()
                        Text(roundDouble(weather.main.feelsLike) + degree)
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350) // Adjust the width and height as desired
                        case .failure(_):
                            ProgressView()
                        case .empty:
                            ProgressView()
                        @unknown default:
                            ProgressView()
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(
                            logo: "thermometer",
                            name: "Min temp",
                            value: roundDouble(weather.main.tempMin) + degree
                        )
                        Spacer()
                        WeatherRow(
                            logo: "thermometer",
                            name: "Max temp",
                            value: roundDouble(weather.main.tempMax) + degree
                        )
                    }
                    
                    HStack {
                        WeatherRow(
                            logo: "wind",
                            name: "Wind speed",
                            value: roundDouble(weather.wind.speed) + degree
                        )
                        Spacer()
                        WeatherRow(
                            logo: "humidity",
                            name: "Humidity",
                            value: roundDouble(weather.main.humidity) + "%"
                        )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(darkBlue)
                .background(.white)
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .modifier(BackgroundWrapper())
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
