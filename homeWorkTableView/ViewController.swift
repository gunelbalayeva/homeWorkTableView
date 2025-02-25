//
//  ViewController.swift
//  homeWorkTableView
//
//  Created by User on 13.02.25.
//

import UIKit

class ViewController: UIViewController {
    private var faqList: [String] = [
         "At amet tempor ac bibendum.",
         "Nisl pellentesque commodo in sit.",
         "Congue diam commodo at dignissim.",
         "Rhoncus sit mauris adipiscing in eget ac mauris.",
         "At id velit feugiat dapibus massa neque id elit.",
         "Turpis tincidunt tempus ornare id ac id aliquam.",
         "Turpis tincidunt tempus ornare id ac id aliquam.",
         "Turpis tincidunt tempus ornare id ac id aliquam."
     ]
     
     @IBOutlet weak var faqTableView: UITableView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         faqTableView.dataSource = self
         faqTableView.delegate = self
         NotificationCenter.default.addObserver(self, selector: #selector(deleteItem), name: Notification.Name("DeleteItem"), object: nil)
     }
    @objc func deleteItem(notification: Notification) {
        if let index = notification.object as? Int {
            faqList.remove(at: index)
            faqTableView.reloadData()
        }
    }
 }

 extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return faqList.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FaqTableViewCell
         myCell.titleLabel.text = faqList[indexPath.row]
         return myCell
     }
     
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return "Hider Title"
     }
 }

 extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let selectedItem = faqList[indexPath.row]
             
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
                 return
             }
             
             secondViewController.contentText = selectedItem
             secondViewController.itemIndex = indexPath.row

             self.present(secondViewController, animated: true, completion: nil)
         }
}
