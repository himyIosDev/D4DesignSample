//
//  FAQViewController.swift
//  D4InteractiveSample
//
//  Created by Hamza Mughal on 07/07/2024.
//

import UIKit

class FAQViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed(_ sender : UIButton) {
        //
        print("backBtnPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
}
