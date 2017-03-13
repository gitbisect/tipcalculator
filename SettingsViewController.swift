//
//  SettingsViewController.swift
//  tippy
//
//  Created by Varghese, John on 3/5/17.
//  Copyright © 2017 Varghese, John. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var msgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let selectedValue = defaults.integer(forKey: "defaultTipPercentage")
        print(selectedValue)
        tipControl.selectedSegmentIndex = selectedValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        let selectedSegmentIndex = tipControl.selectedSegmentIndex
        defaults.set(selectedSegmentIndex, forKey: "defaultTipPercentage")
        defaults.synchronize()

        switch tipControl.selectedSegmentIndex {
        case 0:
            msgLabel.text = "You are Awesome!"
        case 1:
            msgLabel.text = "That is Stupendous!"
        case 2:
            msgLabel.text = "Outstanding! You should win the Nobel Prize!"
        default:
            msgLabel.text = ""

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        msgLabel.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
