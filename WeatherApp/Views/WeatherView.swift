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
        Text(String(weather.coord.lon))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
