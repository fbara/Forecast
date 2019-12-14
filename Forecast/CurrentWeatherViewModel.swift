//
//  CurrentWeatherViewModel.swift
//  Forecast
//
//  Created by Frank Bara on 12/4/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI
import Combine

// View Model that will act as the middle-man between view and API service request.
// As soon as the API returns this model will update our view based on a single property
// marked as @Published.

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(_ city: String = "Chicago") {
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
