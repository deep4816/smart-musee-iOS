//
//  RegisterNewViewController.swift
//  Smart Musee
//
//  Created by Tanvi Panchal on 16/03/17.
//  Copyright © 2017 deep. All rights reserved.
//

import UIKit

class RegisterNewViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtfirstName: UITextField!
    
    @IBOutlet weak var txtlastName: UITextField!
    
    @IBOutlet weak var txtuserName: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet weak var txtretypePassword: UITextField!
    
    @IBOutlet weak var txtemailId: UITextField!
    
    @IBOutlet weak var txtcontact: UITextField!
    
    @IBOutlet weak var txtlanguage: UITextField!

   // @IBOutlet weak var Dropdown: UIPickerView!
    
    @IBOutlet weak var dropdownview: UIPickerView! = UIPickerView()
    let list = ["English", "Gujarati", "Hindi", "French"]
    
      var updateModel = RegisterModel?.self
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.dropdownview.delegate = self
        self.dropdownview.dataSource = self
        
        
        
        self.txtlanguage.inputView = self.dropdownview

        // Do any additional setup after loading the view.
        txtfirstName.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtlastName.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtuserName.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtpassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtretypePassword.attributedPlaceholder = NSAttributedString(string: "Retype Password", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtemailId.attributedPlaceholder = NSAttributedString(string: "Email-Id", attributes: [NSForegroundColorAttributeName: UIColor .white])
        txtcontact.attributedPlaceholder = NSAttributedString(string: "Contact", attributes: [NSForegroundColorAttributeName: UIColor .white])
       txtlanguage.attributedPlaceholder = NSAttributedString(string: "Language", attributes: [NSForegroundColorAttributeName: UIColor .white])
 
       }
    
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int{
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String?
    {
        //self.view.endEditing(true)
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         self.txtlanguage.text = self.list[row]
        
           self.dropdownview.isHidden=true
        let language = txtlanguage.text
        UserDefaults.standard.set(language, forKey: "language")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.txtlanguage {
            self.dropdownview.isHidden=false
            textField.endEditing(true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  


    @IBAction func signUpBtn(_ sender: Any) {
        
        
        
        let userFName = txtfirstName.text
        let userLName = txtlastName.text
        let userName = txtuserName.text
        let userPassword = txtpassword.text
        let userContact = txtcontact.text
        let userEmail = txtemailId.text
        let userLanguage = txtlanguage.text
        let userRetypePassword = txtretypePassword.text
        
        
        
        // ADD USER DATA INTO THE DB...
        let objUserInfo: User = User()
        objUserInfo.UserName = userName
        objUserInfo.FirstName = userFName
        objUserInfo.LastName = userLName
        objUserInfo.Password = userPassword
        objUserInfo.EmailID = userEmail
        objUserInfo.Contact = userContact
        objUserInfo.Language1 = userLanguage
        
        
    
        
        
        if(userFName!.isEmpty || userLName!.isEmpty || userName!.isEmpty ||  userPassword!.isEmpty || userRetypePassword!.isEmpty || userEmail!.isEmpty || userContact!.isEmpty || userLanguage!.isEmpty)
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
       if self.validate(emailId: txtemailId.text!) == false
       {
          displayMyAlertMessage("invalid email-id")
        }
        
        //check if userName already exist
        let objUserSearch: User = User()
        objUserSearch.UserName = userName
        print(objUserSearch.UserName)
        
        let arrAllUser = DBManager.getInstance().getUserDetailsByUserName(objUserSearch)
        
        if arrAllUser.count != 0
        {
            displayMyAlertMessage("Username already exist \n Please choose a different one")
        }
        
        // INSERT IF USER NAME NOT EXISTS.....
        let isInserted = DBManager.getInstance().addUser(UserInfo: objUserInfo)
        if isInserted {
            print("Data Inserted Successfully.....")
        } else {
            print("Error.....")
        }
        

       //nsuser defaults
      /*  UserDefaults.standard.set(userFName, forKey: "userFName")
        UserDefaults.standard.set(userLName, forKey: "userLName")
        
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.set(userRetypePassword, forKey: "userRetypePassword")
        UserDefaults.standard.set(userLanguage, forKey: "userLanguage")
        UserDefaults.standard.set(userContact, forKey: "userContact")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        */
        //nsuser defaults
        let myAlert = UIAlertController(title: "ALert", message: "Registered Successfully", preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion: nil)        }
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)
        
        
        
        
    }
    
    func validate(emailId : String) -> Bool
    {
        let adhoc : String
        adhoc = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format : "SELF MATCHES %@",adhoc).evaluate(with: emailId)
    }
    
    func displayMyAlertMessage(_ userMessage : String)
    {
        let myAlert = UIAlertController(title: "ALert", message: userMessage, preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler : nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)
    }

        
        
        
        
        
        
        
        
     @IBAction func haveAnAccountBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     //   txtlanguage.resignFirstResponder()
        self.view.endEditing(true)
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

