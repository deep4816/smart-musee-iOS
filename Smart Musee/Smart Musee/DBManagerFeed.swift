//
//  DBManagerFeed.swift
//  Smart Musee
//
//  Created by Tanvi Panchal on 03/04/17.
//  Copyright © 2017 deep. All rights reserved.
//



import UIKit


let fsharedInstanceDB = DBManagerFeed()

let fDB_NAME = "Smart_Musee_DB.sqlite"
let fDB_TBL_USER_MASTER = "Feedback"

class DBManagerFeed: NSObject {
    
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
    
    class func getInstance() -> DBManagerFeed
    {
        if(fsharedInstanceDB.database == nil)
        {
            fsharedInstanceDB.database = FMDatabase(path: self.getPath(fileName: fDB_NAME))
        }
        return fsharedInstanceDB
    }
    
    func addUser(FeedInfo : Feedback) -> Bool {
        
        fsharedInstanceDB.database!.open()
        
        let isInserted = fsharedInstanceDB.database?.executeUpdate("INSERT INTO \(fDB_TBL_USER_MASTER) (\(kfUserName), \(kFeedback)) VALUES (?, ?)", withArgumentsIn: [FeedInfo.userName,FeedInfo.feedback])
        
        fsharedInstanceDB.database?.close()
        
        return isInserted!
    }
    
    
        func updateUser(_ FeedInfo : Feedback) -> Bool {
    
            fsharedInstanceDB.database!.open()
    
            let isUpdated = fsharedInstanceDB.database?.executeUpdate("UPDATE \(fDB_TBL_USER_MASTER) SET \(kFeedback)=? WHERE \(kfUserName)=?", withArgumentsIn: [FeedInfo.feedback,FeedInfo.userName])
    
            fsharedInstanceDB.database?.close()
    
            return isUpdated!
        }
    
    
        func deleteAllUser() -> Bool {
    
            fsharedInstanceDB.database!.open()
    
            let isInserted = sharedInstanceDB.database?.executeUpdate("DELETE FROM \(DB_TBL_USER_MASTER)", withArgumentsIn: nil)
    
            fsharedInstanceDB.database?.close()
    
            return isInserted!
        }
    ////
    func getAllUser() -> NSMutableArray {
        
        fsharedInstanceDB.database!.open()
        
        let resultSet: FMResultSet! = fsharedInstanceDB.database!.executeQuery("SELECT * FROM \(fDB_TBL_USER_MASTER)", withArgumentsIn: nil)
        
        let marrStakeInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                
                let FeedInfo : Feedback = Feedback()
                
                FeedInfo.userName = resultSet.string(forColumn: kfUserName)
                FeedInfo.feedback = resultSet.string(forColumn: kFeedback)
                                marrStakeInfo.add(FeedInfo)
            }
        }
        fsharedInstanceDB.database!.close()
        
        return marrStakeInfo
    }
    
    func getUserDetailsByUserName(_ FeedInfo : Feedback) -> NSMutableArray {
        
        fsharedInstanceDB.database!.open()
        
        let resultSet: FMResultSet! = fsharedInstanceDB.database!.executeQuery("SELECT * FROM \(fDB_TBL_USER_MASTER) WHERE \(kfUserName)=?", withArgumentsIn: [FeedInfo.userName])
        
        let marrStakeInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let FeedInfo : Feedback = Feedback()
                
                // userInfo.UserID = resultSet.string(forColumn: kUserID)
                FeedInfo.userName = resultSet.string(forColumn: kfUserName)
                FeedInfo.feedback = resultSet.string(forColumn: kFeedback)
                                marrStakeInfo.add(FeedInfo)
            }
        }
        fsharedInstanceDB.database!.close()
        
        return marrStakeInfo
    }
    
    
    
    
}

