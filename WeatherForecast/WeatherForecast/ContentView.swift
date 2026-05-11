//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 及川 寛太 on 5/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                
                DayForecast(day: "Wed", isRainy: false, high: 90, low: 70)
                
                DayForecast(day: "Thu", isRainy: true, high: 80, low: 50)
                
                DayForecast(day: "Fri", isRainy: false, high: 40, low: 10)
            }
        }
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var highTempColor: Color {
        if high > 70 {
            return Color.red
        } else {
            return Color.black
        }
    }
    
    var lowTempColor: Color {
        if low < 40 {
            return Color.blue
        } else {
            return Color.black
        }
    }

    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
                // TODO: 70度を超える時は赤く、そうでない時は黒くする
                .foregroundStyle(highTempColor)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                // TODO: 40度未満の時は青く、そうでない時は黒くする
                .foregroundStyle(lowTempColor)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
