//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Appinventiv Technologies on 17/10/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    let foreCastApiKey = "0a5898b981bcafe518435c00de21f09a"
    let coordinate: (lat: Double, lang: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastService = ForecastService(APIKey: foreCastApiKey)
        
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.lang) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temperature)°"
                        
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
    }
        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
        }

