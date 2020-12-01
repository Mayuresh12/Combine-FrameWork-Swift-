//
//  weather.swift
//  myWeattherApp
//
//  Created by Mayuresh Rao on 11/30/20.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    // if no reponse is in the temp and humidity return nil
    static var placeHolder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}

