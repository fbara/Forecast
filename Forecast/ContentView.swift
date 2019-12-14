//
//  ContentView.swift
//  Forecast
//
//  Created by Frank Bara on 12/2/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    private var height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GeometryReader { geo in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? geo.size.height : geo.size.height * 0.85)
                    .animation(.easeInOut(duration: 0.5))
            }
            
            //Weekly weather
            //if weeklyWeather list is nil, don't crash, just pass in empty array "[]"
            WeeklyWeatherView(listData: weeklyWeather.weather?.list ?? [], value: selected, height: height * 0.5)
            
            VStack {
                Picker("", selection: $selected) {
                    Text("Today")
                    .tag(0)
                    Text("Week")
                    .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
