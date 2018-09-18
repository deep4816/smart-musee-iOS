//
//  registerViewController.swift
//  League Aegis
//
//  Created by jay patel on 10/2/16.
//  Copyright (c) 2016 deep. All rights reserved.
//

import UIKit

class registerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtretypePassword: UITextField!
    @IBOutlet weak var txtemailId: UITextField!
    @IBOutlet weak var txtcontact: UITextField!
    @IBOutlet weak var txtlanguage: UITextField!
     var updateModel = RegisterModel?.self
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signupButtonPressed(_ sender: UIButton) {
        /*let model = RegisterModel(firstName: txtfirstName.text!, lastName: txtlastName.text!, userName: txtuserName.text!, password: txtpassword.text!, retypePassword: txtretypePassword.text!, emailId: txtemailId.text!, contact: txtcontact.text!, language: txtlanguage.text!)
    //    let result = SQLManager.sharedManager.searchWithIdNum(model.userName)
        var Flag = false
        /* if let id = updateModel?.userName
         {
         if model.idNum == id || result == nil
         {
         if SQLManager.sharedManager.updateWithId(id, model: model) == false
         {
         print("Failed to update item")
         return
         }
         Flag = true
         } */
        if result == nil
        {
          //  if SQLManager.sharedManager.insert(model) == false {
                print("failed to insert item")
                return
            }
            Flag = true
        }
  //      if Flag
        {
            dismissMe(model, flag: false)
        }
        else
        {
            showAlertInfo(model)
        }
    }
    func showAlertInfo(_ model: RegisterModel) {
        let alert = UIAlertController(title: "Be CareFul!", message: "There is already a record with the same ID: \(model.userName), please change to a different one.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "REPLACE IT!", style: .default, handler: { (alertAction) in
            self.dismissMe(model, flag: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    func dismissMe(_ model: RegisterModel, flag: Bool) {
        if flag
        {
            if SQLManager.sharedManager.insert(model) == false {
                print("failed to insert item")
                return
            }
        }
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        //  homeVC.updateData(model, replace: flag)
        // self.navigationController!.popToViewController(homeVC, animated: true)
    }
    

    
   
     /*   let userFName = userFNameTextField.text
        let userLName = userLNameTextField.text
        let userName = userNameTextfield.text                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        let userPassword = userPasswordTextField.text
        let userRetypePassword = userRetypePasswordTextField.text
        let userAddress = userAddressTextField.text
        let userContact = userContactTextField.text
      
        let userEmailId = userEmailIdTextField.text
        let userCountry = userCountryTextField.text
        let userBirthDate = userBirthDateTextField.text
        
        if(userFName!.isEmpty || userLName!.isEmpty || userName!.isEmpty ||  userPassword!.isEmpty || userRetypePassword!.isEmpty || userEmailId!.isEmpty || userAddress!.isEmpty || userContact!.isEmpty || userCountry!.isEmpty || userBirthDate!.isEmpty)
        {
            displayMyAlertMessage("All fields are required")
            
            return
        }
        if(userPassword != userRetypePassword)
        {
              displayMyAlertMessage("Password doesn't match")
        return
        }
        if(userContact!.characters.count<10 || userContact!.characters.count>10)
        {
            displayMyAlertMessage("number must be of 10 digits")
        }
        
    //    if(!.characters.count>2)
    //    {
     //       displayMyAlertMessage("age is invalid")
     //   }
        
        
        UserDefaults.standard.set(userFName, forKey: "userFName")
        UserDefaults.standard.set(userLName, forKey: "userLName")
      
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.set(userRetypePassword, forKey: "userRetypePassword")
        UserDefaults.standard.set(userAddress, forKey: "userAddress")
        UserDefaults.standard.set(userContact, forKey: "userContact")
        UserDefaults.standard.set(userCountry, forKey: "userCountry")
    UserDefaults.standard.set(userEmailId, forKey: "userEmailId")
        UserDefaults.standard.set(userBirthDate, forKey: "userBirthDate")
        
    
        let myAlert = UIAlertController(title: "ALert", message: "Registration is successful....thank you...", preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){
        action in self.dismiss(animated: true, completion: nil)        }
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)

    
    
    
        /* self.userNameTextfield.resignFirstResponder()
       
        self.userNameTextfield.resignFirstResponder()
        self.userAddressTextField.resignFirstResponder()
        self.userRetypePasswordTextField.resignFirstResponder()
        self.userContactTextField.resignFirstResponder()
        self.userAgeTextField.resignFirstResponder()
        self.userPasswordTextField.resignFirstResponder()
*/
    
    
    }
        func displayMyAlertMessage(_ userMessage : String)
    {
    let myAlert = UIAlertController(title: "ALert", message: userMessage, preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler : nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)
    } */

   */ }

    @IBAction func haveAnAccount(_ sender: UIButton) {
       // self.window
        
      self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
