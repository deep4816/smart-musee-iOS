//
//  menuViewController.swift
//  memuDemo
//
//  Created by deep
//  Copyright © 2016 deep. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = ["Home","Profile","Language Setting","Feedback","About Us","Sign Out"]
        iconArray = [UIImage(named:"home")!,UIImage(named:"profile")!,UIImage(named:"setting")!,UIImage(named:"feedback")!,UIImage(named:"aboutUs")!,UIImage(named:"logout")!]
        
//        imgProfile.layer.borderWidth = 2
//        imgProfile.layer.borderColor = UIColor.green.cgColor
//        imgProfile.layer.cornerRadius = 50
//        
//        imgProfile.layer.masksToBounds = false
//        imgProfile.clipsToBounds = true 
        // Do any additional setup after loading the view.
        tblTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.lblMenuname.text!)
        if cell.lblMenuname.text! == "Home"
        {
            print("Home Tapped")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuname.text! == "Profile"
        {
            print("profile Tapped")
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }

        
        if cell.lblMenuname.text! == "Feedback"
        {
            print("feedback Tapped")
           
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuname.text! == "About Us"
        {
            print("About UsTapped")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuname.text! == "Language Setting"
        {
           print("Language setting Tapped")
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        
        if cell.lblMenuname.text! == "Sign Out"
        {
            print("Signout Tapped")
            
            

              let title = "Sign Out"
            let message = "Do you really want to sign out!!"
            let yesText = "YES"
            let noText = "NO"
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            let yesButton = UIAlertAction(title: yesText, style: UIAlertActionStyle.default){ (ACTION) in
                let mainstoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
             //self.navigationController?.pushViewController(newViewcontroller, animated: true)
                self.present(newViewcontroller, animated: true, completion: nil)
    }
    
            
            let noButton = UIAlertAction(title: noText, style: UIAlertActionStyle.default){(ACTION) in alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(yesButton)
            alert.addAction(noButton)
            self.present(alert,animated: true, completion: nil)

        }
            
          //  navigationItem.hidesBackButton = true
    //revealviewcontroller.didMove(toParentViewController: newFrontController)
        
        }

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    


