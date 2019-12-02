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
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            fatalError()
        }
        
        component.queryItems = queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return component.url
    }
}
