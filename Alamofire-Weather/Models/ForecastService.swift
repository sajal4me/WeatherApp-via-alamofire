//
//  ForecastService.swift
//  Alamofire-Weather
//
//  Created by Appinventiv Technologies on 12/10/17.

import Foundation
import Alamofire

class ForecastService {
    
    // https://api.darksky.net/forecast/0a5898b981bcafe518435c00de21f09a/37.8267,-122.4233
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void) {
        print("# getCurrentWeather")
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            
            Alamofire.request(forecastURL).responseJSON(completionHandler: { (response) in
                if let jsonDictionary = response.result.value as? [String: Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as?  [String: Any] {
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
}
