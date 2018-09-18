//
//  SignInViewController.swift
//  League Aegis
//
//  Created by jay patel on 10/3/16.
//  Copyright (c) 2016 deep. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    
  //  var updateModel = RegisterModel?.self
    
  //   var userArray: [RegisterModel] = SQLManager.sharedManager.allItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
     /*  userName.attributedPlaceholder = NSAttributedString(string: "UserName", attributes: [NSForegroundColorAttributeName: UIColor.white])
        userPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.white])
*/
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
       
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.hidesBackButton = true
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
    }
    
    @IBAction func RegisterBtn(_ sender: UIButton) {
        
    }
    
    
    @IBAction func loginBUttonTapped(_ sender: UIButton) {
        
        
        
      /*  let uName = userName.text
        let uPassword = userPassword.text
      UserDefaults.standard.set(userName, forKey: "userName")
     UserDefaults.standard.set(userPassword, forKey: "userPassword")
       if(uName!.isEmpty || uPassword!.isEmpty)
        {
            displayMyAlertMessage("All fields are required")
            
        return
        }
        
       // for model in userArray{
            if uName == model.userName{
                if uPassword == model.password{
                    print("yipee")
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let newVC : ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.navigationController?.pushViewController(newVC, animated: true)
                }
                else {
                     displayMyAlertMessage("Password is Incorrect!!..Please enter correct password")
                    }
                
            }
            else {
                
                 displayMyAlertMessage("user doesn't exist")
            }
 
                }}}

        
        self.userName.resignFirstResponder()
        
        self.userPassword.resignFirstResponder()

   }

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
 
        let uName = userName.text
        let uPassword = userPassword.text
        
        if(uName!.isEmpty || uPassword!.isEmpty)
        {
            displayMyAlertMessage("All fields are required")
            
            return
        }
       // let uNameStored =  UserDefaults.standard.string(forKey: "userName")
     //   let uPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        let objUserSearch: User = User()
        objUserSearch.UserName = uName
        print(objUserSearch.UserName)
      
        let arrAllUser = DBManager.getInstance().getUserDetailsByUserName(objUserSearch)
        
        if arrAllUser.count==0
        {
            displayMyAlertMessage("User doesn't exist")
        }
        else{
            
        
            
            let objResultUser = arrAllUser.object(at: 0) as! User
            print("If user will found by username \(objResultUser)")
            print(objResultUser.UserName)
            print(objResultUser.EmailID)
            print(objResultUser.Password)
            if objResultUser.Password == uPassword
            {
              print("logged in")
                let language = objResultUser.Language1
                UserDefaults.standard.set(language, forKey: "language")
                let userName = objResultUser.UserName
                UserDefaults.standard.set(userName, forKey: "userName")
                
                
                
            }
            else {
                displayMyAlertMessage("Password doesnt match")
            }
        }

       
        
//        if(uNameStored==uName)
//        {
//            if(uPasswordStored==uPassword)
//            {
//                
//                
//                /*   let myAlert = UIAlertController(title: "Message", message: "Sign in is successful...congo...", preferredStyle: UIAlertControllerStyle . alert)
//                 
//                 let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){
//                 action in self.dismiss(animated: true, completion: nil)        }
//                 myAlert.addAction(okAction)
//                 self.present(myAlert,animated : true,completion : nil)*/
//                
//                
//                
//                /*   NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
//                 NSUserDefaults.standardUserDefaults().synchronize()
//                 self.dismissViewControllerAnimated(true, completion: nil)*/
//            }
//                
//            else
//            {
//                displayMyAlertMessage("password doesn't match")
//            }
//        }
//        else
//        {
//            displayMyAlertMessage("user doesn't exist")
//        }
        
        self.userName.resignFirstResponder()
        
        self.userPassword.resignFirstResponder()
        
        
        // SEARCH GET USER DETAILS BY USERNAME....
        
                //---------------------------------------------------------------
        

        
    }
    

        
    func displayMyAlertMessage(_ userMessage : String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler : nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
