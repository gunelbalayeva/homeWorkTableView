//
//  SecondViewController.swift
//  homeWorkTableView
//
//  Created by User on 14.02.25.
//

import UIKit

class SecondViewController:UIViewController{
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var contentText:String?
    var itemIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLabel.layer.cornerRadius = 16
        contentLabel.layer.masksToBounds = true
        contentLabel.text = contentText
       
    }
    
    @IBAction func deleteSolidButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("DeleteItem"), object: itemIndex)
           self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeClickButton(_ sender: UIButton) {
            sender.layer.cornerRadius = 16
            sender.layer.masksToBounds = true
        self.dismiss(animated: true, completion: nil)
    }
}
