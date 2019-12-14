//
//  API.swift
//  Forecast
//
//  Created by Frank Bara on 12/2/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

private let baseURLforCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appID = "f3325535a886e91e7869de777512a572"
private let baseURLForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder {
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    
    return decode
}


import SwiftUI

class API {
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void) {
        let query = ["q": "\(city)", "appid": appID, "units": "Imperial"]
        
        guard let url = baseURLforCurrentWeather.withQueries(query) else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
    
    class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
        let query = ["q": "\(city)", "appid": appID, "units": "Imperial", "cnt": "5"]
        guard baseURLForWeeklyWeather.withQueries(query) != nil else {
            fatalError("Invalid URL for weekly weather")
        }
        guard let url = baseURLForWeeklyWeather.withQueries(query) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            
            do {
                let weather = try decoder.decode(WeeklyWeather.self, from: data)
                //run on the main thread, not background
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}


