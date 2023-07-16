//
//  Utils.swift
//  WeatherApp
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import SwiftUI

func roundDouble(_ value: Double) -> String {
    return String(format: "%.0f", value)
}


// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

let degree = "°"
