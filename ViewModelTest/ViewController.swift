//
//  ViewController.swift
//  ViewModelTest
//
//  Created by diego paredes on 23/10/19.
//  Copyright © 2019 Diego Paredes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let light = Notification.Name(rawValue: MainNotifications.lightNotificationKey)
    
    @IBOutlet weak var StatusLabel: UILabel!
    @IBAction func ChangeStatus(_ sender: Any) {
        MainViewModel.status+=1
        updateText()
    }
    @IBAction func GoToSecondView(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
        createObservers()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateText(){
        StatusLabel.text = String(MainViewModel.status)
    }
    
    func createObservers() {
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: light, object: nil)
    }
    
    @objc func updateCharacterImage(notification: NSNotification) {
        print("si se activa")
        updateText()
    }

}

