//
//  HomeViewController.swift
//  D4InteractiveSample
//
//  Created by Hamza Mughal on 07/07/2024.
//

import UIKit

class HomeViewController: UIViewController {

    
    //MARK: - ********** IBOutlets and Variables ********** -
    
    @IBOutlet weak var sideMenuTrailingConstraint : NSLayoutConstraint!
    
    //MARK: - ********** LifeCycle ********** -
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - ********** Action Methods ********** -
    
    @IBAction func sideMenuOptionsBtnPressed(_ sender : UIButton) {
        //
        print("dashboardBtnPressed")
        self.handleSideMenuClick(tag: sender.tag)
    }
    
    // **********************************************************************
    
    @IBAction func sideMenuBtnPressed(_ sender : UIButton) {
        //
        print("sideMenuBtnPressed")
        
        UIView.animate(withDuration: 0.3) {
            //
            self.sideMenuTrailingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    // **********************************************************************
    
    @IBAction func sideMenuCloseBtnPressed(_ sender : UIButton) {
        //
        print("sideMenuCloseBtnPressed")
        
        UIView.animate(withDuration: 0.3) {
            //
            self.sideMenuTrailingConstraint.constant = 500
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - ********** Methods ********** -
    
    
    func handleSideMenuClick (tag : Int) {
        //
        /// tags attached to the side menu options buttons
        /// 1 = dashboard
        /// 2 = schedule
        /// 3 = forum
        /// 4 = history
        /// 5 = settings
        /// 6 = FAQ
        
        UIView.animate(withDuration: 0.3) {
            //
            self.sideMenuTrailingConstraint.constant = 500
            self.view.layoutIfNeeded()
        }
        
        switch tag {
        
        case 1:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        case 2:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        case 3:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForumViewController") as! ForumViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        case 4:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        case 5:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        case 6:
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
        default:
            return
        }
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return 5
    }
    
    // **********************************************************************
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath)
        return cell
    }
    
    // **********************************************************************
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //
        let width  = UIScreen.main.bounds.width - 40
        let height = 120.0
        
        return CGSizeMake(width, height)
    }
    
    // **********************************************************************
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CourseDetailViewController") as! CourseDetailViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
