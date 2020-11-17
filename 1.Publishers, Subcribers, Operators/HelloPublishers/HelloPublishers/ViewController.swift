//
//  ViewController.swift
//  HelloPublishers
//
//  Created by Mayuresh Rao on 11/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification.Name("My Notification")
        // Creating a publisher
        let publisher = NotificationCenter.default.publisher(for: notification)
        // Creating a subcriber
        let subscriber = publisher.sink{ _ in
            print("Notification received")
        }
        
        NotificationCenter.default.post(name: notification, object: nil)
    }


}

