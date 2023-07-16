//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView().modifier(BackgroundWrapper())
    }
}
