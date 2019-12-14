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
                // TODO: put weather icon here
                Text("\(list.temp.min.round)º")
                .font(.title)
                .foregroundColor(.white)
            }
            
            Text(list.weather.last?.description ?? "Unknown")
                .font(.system(size: 16))
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
