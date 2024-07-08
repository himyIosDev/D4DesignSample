//
//  CourseDetailViewController.swift
//  D4InteractiveSample
//
//  Created by Hamza Mughal on 07/07/2024.
//

import UIKit

class CourseDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
