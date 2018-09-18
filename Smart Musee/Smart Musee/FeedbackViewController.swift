//
//  MessageViewController.swift
//  memuDemo
//
//  Created by Parth Changela on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var menu: UIBarButtonItem!
 //   @IBOutlet weak var txtuserName: UITextField!
    
    @IBOutlet weak var txtFeedback: UITextView!
  //  var updateModel = FeedbackModel?.self
   // var updateModel = FeedbackModel?.self

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSend(_ sender: Any) {
        
        let uName = UserDefaults.standard.string(forKey: "userName")

        let uFeed = txtFeedback.text
        if(uName!.isEmpty || uFeed!.isEmpty)
        {
            displayMyAlertMessage("Feedback can not be empty")
            
            return
        }

        //Feedback insertion
        let objFeedInfo: Feedback = Feedback()
        objFeedInfo.userName = uName
        objFeedInfo.feedback = uFeed
        
        let isInserted = DBManagerFeed.getInstance().addUser(FeedInfo: objFeedInfo)
        if isInserted {
            print("Feedback inserted")
        } else {
            print("error")
        }
        
    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(newVC, animated: true)
        
//        let model = FeedbackModel(userName: txtuserName.text!, feedback: txtFeedback.text!)
//        let res = SQLFeedback.sharedManager.searchWithIdNum(model.userName)
//        var Flag = false
//        /* if let id = updateModel?.userName
//         {
//         if model.idNum == id || result == nil
//         {
//         if SQLManager.sharedManager.updateWithId(id, model: model) == false
//         {
//         print("Failed to update item")
//         return
//         }
//         Flag = true
//         } */
//        if res == nil
//        {
//            if SQLFeedback.sharedManager.insert(model) == false {
//                print("failed to insert item")
//                return
//            }
//            Flag = true
//        }
//        if Flag
//        {
//            dismissMe(model, flag: false)
//        }
//        else
//        {
//            showAlertInfo(model)
//        }
//    }
//    func showAlertInfo(_ model: FeedbackModel) {
//        let alert = UIAlertController(title: "Be CareFul!", message: "There is already a record with the same ID: \(model.userName), please change to a different one.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//       // alert.addAction(UIAlertAction(title: "REPLACE IT!", style: .default, handler: { (alertAction) in
//            //self.dismissMe(model, flag: true)
//        //}))
//        present(alert, animated: true, completion: nil)
//    }
//    func dismissMe(_ model: FeedbackModel, flag: Bool) {
//        if flag
//        {
//            if SQLFeedback.sharedManager.insert(model) == false {
//                print("failed to insert item")
//                return
//            }
//        }
//        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        //  homeVC.updateData(model, replace: flag)
//        // self.navigationController!.popToViewController(homeVC, animated: true)
    }
    func displayMyAlertMessage(_ userMessage : String)
    {
        let myAlert = UIAlertController(title: "ALert", message: userMessage, preferredStyle: UIAlertControllerStyle . alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler : nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion : nil)
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
