//
//  homeViewController.swift
//  Smart Musee
//
//  Created by Tanvi Panchal on 16/02/17.
//  Copyright © 2017 deep. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//let x = UINavigationController().navigationBar.barTintColor(UIColor (displayP3Red: 218, green: 230, blue: 242, alpha: nil) )
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: (218/255.0), green: (230/255.0), blue: (242/255.0), alpha: 1.0)
        self.tabBarController?.tabBar.barTintColor = UIColor.init(red: (218/255.0), green: (230/255.0), blue: (242/255.0), alpha: 1.0)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
    //    self.navigationController!.popToRootViewController(animated: true)
        
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
