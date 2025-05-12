//
//  WeatherResponse.swift
//  SmallWeatherApp
//
//  Created by Manyuchi, Carrington C on 2025/05/12.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
}
