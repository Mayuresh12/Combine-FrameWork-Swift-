//
//  ViewController.swift
//  myWeattherApp
//
//  Created by Mayuresh Rao on 11/30/20.
//

import UIKit
import Combine
class ViewController: UIViewController {

    @IBOutlet var temperatureLabel: UILabel!
    
    private var  webservice: Webservice = Webservice()
    private var  cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.fetchweather(city: "Nagpur")
            .catch{ _ in Just(Weather.placeHolder) }
            .map {weather in
                if let temp = weather.temp{
                    return "\(temp)"
                } else
                {
                    return "Error in getting weather!"
                }
            }.assign(to: \.text, on: self.temperatureLabel)
    }


}

