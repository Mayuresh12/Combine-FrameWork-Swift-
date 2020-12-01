//
//  WebService.swift
//  myWeattherApp
//
//  Created by Mayuresh Rao on 11/30/20.
//

import Foundation
import Combine

class Webservice {
    
    func fetchweather(city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weather )else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
