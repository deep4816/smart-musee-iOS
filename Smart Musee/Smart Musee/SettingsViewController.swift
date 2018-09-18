//
//  SettingsViewController.swift
//  Smart Musee
//
//  Created by Tanvi Panchal on 08/03/17.
//  Copyright © 2017 deep. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UITextFieldDelegate, UIPickerViewDelegate,UINavigationBarDelegate ,UINavigationControllerDelegate {

    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var dropdown: UIPickerView!
 //   var toolBar : UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let language = UserDefaults.standard.value(forKey: "language")
        textbox.text = language as! String?
        
        self.dropdown.delegate = self
        self.dropdown.dataSource = self
        // Do any additional setup after loading the view.
       // revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
       // let toolBar = UIToolbar()
     //   toolBar.barStyle = UIBarStyle.default
     //   toolBar.isTranslucent = true
      //  toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
       // toolBar.sizeToFit()
        
      //  let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SettingsViewController.donePressed))
      //  toolBar.setItems([doneButton], animated: false)
       // toolBar.isUserInteractionEnabled = true
       // textbox.inputAccessoryView = toolBar
        textbox.inputView = dropdown
       // self.dropdown.selectedRow(inComponent: 0)
    
    }
    @IBOutlet weak var textbox: UITextField!
   
    var list = ["English","Hindi","Gujarati","French"]
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int{
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String?
    {   self.view.endEditing(true)
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textbox.text = self.list[row]
        self.dropdown.isHidden=true
        let language = textbox.text
        UserDefaults.standard.set(language, forKey: "language")
    
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.textbox {
            self.dropdown.isHidden=false
            textField.endEditing(true)
        }
    }

    @IBAction func saveLangPressed(_ sender: UIButton) {
        
       
     /*  let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(newVC, animated: true)
    
        self.navigationController?.setNavigationBarHidden(false, animated: true)*/
    }
    
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
