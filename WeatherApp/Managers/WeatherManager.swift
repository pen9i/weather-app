//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by eric on 18/02/2024.
//

import CoreLocation
import Foundation

class WeatherManager {
    func getCurrentWeather(latitute: CLLocationDegrees, longitute: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitute)&lon=\(longitute)&appid=8acf9f7b0cff652a430ab0c1655e9e6a") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as! HTTPURLResponse).statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)

        return decodedData
    }
}
