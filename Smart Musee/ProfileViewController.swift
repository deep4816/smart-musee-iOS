//
//  ProfileViewController.swift
//  Smart Musee
//
//  Created by Tanvi Panchal on 06/04/17.
//  Copyright © 2017 deep. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationBarDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var menu: UIBarButtonItem!

    
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtemailId: UITextField!
    @IBOutlet weak var txtcontact: UITextField!
    @IBOutlet weak var txtretypePassword: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    
    @IBOutlet weak var lblretypePwd: UILabel!
    //var editTextfieldToggle: Bool = false
   
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        //View Profile
        let uName = UserDefaults.standard.string(forKey: "userName")
        let objUserSearch: User = User()
        objUserSearch.UserName = uName
        
        let arrAllUser = DBManager.getInstance().getUserDetailsByUserName(objUserSearch)
        let objResultUser = arrAllUser.object(at: 0) as! User
        print(objResultUser.UserName)
        txtuserName.text = objResultUser.UserName
        txtfirstName.text = objResultUser.FirstName
        txtlastName.text = objResultUser.LastName
        txtpassword.text = objResultUser.Password
        txtretypePassword.text = objResultUser.Password
        txtemailId.text = objResultUser.EmailID
        txtcontact.text = objResultUser.Contact
        
        
    }
    

    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        
        txtfirstName.isUserInteractionEnabled = true
        txtlastName.isUserInteractionEnabled = true
        txtpassword.isUserInteractionEnabled = true
        txtretypePassword.isUserInteractionEnabled = true
        txtemailId.isUserInteractionEnabled = true
        txtcontact.isUserInteractionEnabled = true
       saveBtn.isHidden = false
        txtretypePassword.isHidden = false
        lblretypePwd.isHidden = false
        txtfirstName.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtfirstName.textColor = UIColor.black
        
        txtlastName.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtlastName.textColor = UIColor.black
        
        txtpassword.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtpassword.textColor = UIColor.black
        
        txtretypePassword.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtretypePassword.textColor = UIColor.black
        
        txtemailId.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtemailId.textColor = UIColor.black
        
        txtcontact.backgroundColor = UIColor(red: 233, green: 236, blue: 248, alpha: 0.699999988079071)
        txtcontact.textColor = UIColor.black
    }
    @IBAction func saveInfoBtn(_ sender: Any) {
        let userFName = txtfirstName.text
        let userLName = txtlastName.text
       // let userName = txtuserName.text
        let userPassword = txtpassword.text
        let userContact = txtcontact.text
        let userEmail = txtemailId.text
       // let userLanguage = txtlanguage.text
        let userRetypePassword = txtretypePassword.text
 
        
        
        if(userFName!.isEmpty || userLName!.isEmpty ||  userPassword!.isEmpty || userRetypePassword!.isEmpty || userEmail!.isEmpty || userContact!.isEmpty )
        {
            DispatchQueue.main.async(execute: { () -> Void in
                let message = "All fields required!"
                self.displayAlert(msg: message)
            })
            print("Alert displayed")
            


//            displayAlertMessage("All fields are required")
//            print("Alert displayed")
//            return
        }
        if(userPassword != userRetypePassword)
        {
            DispatchQueue.main.async(execute: {() -> Void in
            let message = "Password doesn't match!!"
            self.displayAlert(msg: message)
            })
            print("Alert displayed")

            return
        }
        if(userContact!.characters.count<10 || userContact!.characters.count>10)
        {
            DispatchQueue.main.async(execute: {() -> Void in
                let message = "Number must be of 10 digits"
                self.displayAlert(msg: message)
            })
            print("Alert displayed")
            


            return
        }
        if self.validate(emailId: txtemailId.text!) == false
        {
            DispatchQueue.main.async(execute: {() -> Void in
                let message = "Invalid Email address"
                self.displayAlert(msg: message)
            })
            print("Alert displayed")
            
            
//            displayAlertMessage("invalid email-id")
//            print("Alert displayed")

            return
        }

        //update profile
        
        // ADD USER DATA INTO THE DB...
        let objUserInfo: User = User()
        objUserInfo.UserName = txtuserName.text
        objUserInfo.FirstName = userFName
        objUserInfo.LastName = userLName
        objUserInfo.Password = userPassword
        objUserInfo.EmailID = userEmail
        objUserInfo.Contact = userContact
        

        
        let isUpdated = DBManager.getInstance().updateUser(objUserInfo)
        if isUpdated {
            
            DispatchQueue.main.async(execute: { () -> Void in
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newVC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.navigationController?.pushViewController(newVC, animated: true)
                
            })
            
            


            
        } else {
            print ("Error")
        }
    
    }
    func displayAlert(msg:String)
    {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

func validate(emailId : String) -> Bool
{
    let adhoc : String
    adhoc = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format : "SELF MATCHES %@",adhoc).evaluate(with: emailId)
}

}
