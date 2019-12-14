//
//  Weather.swift
//  Forecast
//
//  Created by Frank Bara on 12/2/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//
// Weather Model

import Foundation

struct Weather: Codable {
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    let clouds: Clouds
    let sys: Sys
}

struct Coord: Codable {
    let lon, lat: Double
}

struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}

struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}

struct Clouds: Codable {
    let all: Double
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset:  Int
}

