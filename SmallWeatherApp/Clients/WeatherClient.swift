//
//  WeatherClient.swift
//  SmallWeatherApp
//
//  Created by Manyuchi, Carrington C on 2025/05/12.
//

import Foundation


struct WeatherClient {
    
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endPointURL(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let weatherresponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherresponse.main
    }
}
