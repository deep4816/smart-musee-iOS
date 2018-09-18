//
//  DBManager.swift
//  StakesApp
//
//  Created by Hemen Gohil on 6/23/16.
//  Copyright © 2016 Hemen Gohil. All rights reserved.
//

import UIKit


let sharedInstanceDB = DBManager()

let DB_NAME = "Smart_Musee_DB.sqlite"
let DB_TBL_USER_MASTER = "User"

class DBManager: NSObject {

    var database: FMDatabase? = nil

    
    class func getPath(fileName: String) -> String {
        
        let documentsURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        return documentsURL!.path
        
    }

    class func copyFile(fileName: NSString) {
        let dbPath: String = getPath(fileName: fileName as String)
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath) {
            
            let fromPathString = Bundle.main.path(forResource: "Smart_Musee_DB", ofType: "sqlite")
            
            if fileManager.fileExists(atPath: fromPathString!) {
                print("Yes Bundle DB Is there.....")
            }
            
            var error : NSError?
            do {
                
                try fileManager.copyItem(atPath: fromPathString!, toPath: dbPath)
                
            } catch let error1 as NSError {
                error = error1
            }
            //            let alert: UIAlertView = UIAlertView()
            if (error != nil) {
                print("DATABASE ERROR WHEN COPIYING at Path : \(dbPath)")
                
                //                alert.title = "Error Occured"
                //                alert.message = error?.localizedDescription
            } else {
                
                //                alert.title = "Successfully Copy"
                //                alert.message = "Your database copy successfully"
                
                print("DATABASE COPIED at Path : \(dbPath)")
                
            }
            //            alert.delegate = nil
            //            alert.addButtonWithTitle("Ok")
            //            alert.show()
        }else{
            print("DATABASE ALREADY EXIST Path : \(dbPath)")
        }
    }

    class func getInstance() -> DBManager
    {
        if(sharedInstanceDB.database == nil)
        {
            sharedInstanceDB.database = FMDatabase(path: self.getPath(fileName: DB_NAME))
        }
        return sharedInstanceDB
    }
    
    func addUser(UserInfo : User) -> Bool {
        
        sharedInstanceDB.database!.open()
        
        let isInserted = sharedInstanceDB.database?.executeUpdate("INSERT INTO \(DB_TBL_USER_MASTER) (\(kUserName), \(kFirstName), \(kLastName), \(kPassword), \(kEmailID), \(kContact), \(kLanguage)) VALUES (?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: [UserInfo.UserName,UserInfo.FirstName,UserInfo.LastName,UserInfo.Password,UserInfo.EmailID,UserInfo.Contact,UserInfo.Language1])
        
        sharedInstanceDB.database?.close()
        
        return isInserted!
    }

    
    func updateUser(_ UserInfo : User) -> Bool {
        
        sharedInstanceDB.database!.open()
        
        print(UserInfo.FirstName)
        print(UserInfo.LastName)
        print(UserInfo.UserName)
        print(UserInfo.Password)
        print(UserInfo.EmailID)
        print(UserInfo.Contact)
        
        
        
        let isUpdated = sharedInstanceDB.database?.executeUpdate("UPDATE \(DB_TBL_USER_MASTER) SET \(kFirstName)=?, \(kLastName)=?, \(kPassword)=?, \(kEmailID)=?, \(kContact)=? WHERE \(kUserName)=?", withArgumentsIn: [UserInfo.FirstName,UserInfo.LastName,UserInfo.Password,UserInfo.EmailID,UserInfo.Contact, UserInfo.UserName])
        
        sharedInstanceDB.database?.close()

        return isUpdated!
    }

    
    func deleteAllUser() -> Bool {
        
        sharedInstanceDB.database!.open()
        
        let isInserted = sharedInstanceDB.database?.executeUpdate("DELETE FROM \(DB_TBL_USER_MASTER)", withArgumentsIn: nil)
        
        sharedInstanceDB.database?.close()
        
        return isInserted!
    }
////
    func getAllUser() -> NSMutableArray {
        
        sharedInstanceDB.database!.open()
        
        let resultSet: FMResultSet! = sharedInstanceDB.database!.executeQuery("SELECT * FROM \(DB_TBL_USER_MASTER)", withArgumentsIn: nil)
        
        let marrStakeInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                
                let userInfo : User = User()
                
                userInfo.UserName = resultSet.string(forColumn: kUserName)
                userInfo.FirstName = resultSet.string(forColumn: kFirstName)
                userInfo.LastName = resultSet.string(forColumn: kLastName)
                userInfo.Password = resultSet.string(forColumn: kPassword)
                userInfo.EmailID = resultSet.string(forColumn: kEmailID)
                userInfo.Contact = resultSet.string(forColumn: kContact)
                userInfo.Language1 = resultSet.string(forColumn: kLanguage)

                marrStakeInfo.add(userInfo)
            }
        }
        sharedInstanceDB.database!.close()
        
        return marrStakeInfo
    }
    
    func getUserDetailsByUserName(_ UserInfo : User) -> NSMutableArray {
        
        sharedInstanceDB.database!.open()
        
        let resultSet: FMResultSet! = sharedInstanceDB.database!.executeQuery("SELECT * FROM \(DB_TBL_USER_MASTER) WHERE \(kUserName)=?", withArgumentsIn: [UserInfo.UserName])
        
        let marrStakeInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let userInfo : User = User()
                
               // userInfo.UserID = resultSet.string(forColumn: kUserID)
                userInfo.UserName = resultSet.string(forColumn: kUserName)
                userInfo.FirstName = resultSet.string(forColumn: kFirstName)
                userInfo.LastName = resultSet.string(forColumn: kLastName)
                userInfo.Password = resultSet.string(forColumn: kPassword)
                userInfo.EmailID = resultSet.string(forColumn: kEmailID)
                userInfo.Contact = resultSet.string(forColumn: kContact)
                userInfo.Language1 = resultSet.string(forColumn: kLanguage)
                
                marrStakeInfo.add(userInfo)
            }
        }
        sharedInstanceDB.database!.close()
        
        return marrStakeInfo
    }

    


}
