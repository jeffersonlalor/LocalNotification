//
//  ViewController.swift
//  LocalNotification
//
//  Created by Jefferson de Oliveira Lalor on 21/05/20.
//  Copyright © 2020 Lalor. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setReminderTapped(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = "\(Bundle.main.infoDictionary?["CFBundleName"] ?? "NameFailed")"
        content.body = "This is a local notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        center.add(request) { (_error) in
            guard let error = _error else {return}
            print("Error -> \(error.localizedDescription)")
        }
    }
}

