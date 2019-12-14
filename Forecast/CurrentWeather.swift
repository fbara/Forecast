//
//  CurrentWeather.swift
//  Forecast
//
//  Created by Frank Bara on 12/4/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    var weather: Weather?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Now in \(weather?.name ?? "Unknown")")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            
            HStack {
                Text("\(weather?.main.temp.round ?? 0)º")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 65))
            }
            
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.largeTitle)
            
            Text("High: \(weather?.main.tempMax.round ?? 0)º")
                .foregroundColor(.white)
                .font(.title)
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(radius: 20)
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
