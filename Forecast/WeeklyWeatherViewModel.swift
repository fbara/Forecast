//
//  WeeklyWeatherViewModel.swift
//  Forecast
//
//  Created by Frank Bara on 12/7/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "Oswego") {
        API.weeklyWeather(city) {
            self.weather = $0
        }
    }
}
