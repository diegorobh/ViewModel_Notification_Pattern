//
//  SecondViewController.swift
//  ViewModelTest
//
//  Created by diego paredes on 23/10/19.
//  Copyright © 2019 Diego Paredes. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBAction func ChangeStatusAction(_ sender: Any) {
        MainViewModel.status+=1
        updateText()
        let name = Notification.Name(rawValue: MainNotifications.lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        //dismiss(animated: true, completion: nil)
    }
    @IBAction func GoToFIrstView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }

    func updateText(){
        statusLabel.text = String(MainViewModel.status)
    }
    
}
