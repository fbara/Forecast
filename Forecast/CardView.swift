//
//  CardView.swift
//  Forecast
//
//  Created by Frank Bara on 12/7/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var list: ListData
    
    var body: some View {
        VStack {
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                .font(.title)
                .foregroundColor(.white)
            
            HStack {
                Text("\(list.temp.day.round)º")
                    .font(.title)
                    .bold()
                Image(list.weather.last?.icon ?? "01d")
                    .resizable()
                    .frame(width: 70, height: 70)
                Text("\(list.temp.min.round)º")
                    .font(.system(size: 26, weight: .thin))
                    .foregroundColor(.white)
            }
            
            Text(list.weather.last?.description ?? "Unknown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    var timestamp: TimeInterval

    init(_ timestamp: TimeInterval) {
        self.timestamp = timestamp
    }

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
    }

    private var day: String {
        return dayOfTheWeekFromTimestamp(self.timestamp)
    }
}
