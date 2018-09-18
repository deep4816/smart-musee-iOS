////
////  SQLFeedback.swift
////  databaseReg
////
////  Created by Tanvi Panchal on 20/03/17.
////  Copyright © 2017 Tanvi Panchal. All rights reserved.
////
//
//import Foundation
//
//class SQLFeedback: NSObject {
//    
//    let kNameFile = "/Register.sqlite"
//    
//    static let sharedManager = SQLFeedback()
//    
//    var db: OpaquePointer? = nil
//    
//    fileprivate override init() {
//        super.init()
//        createDatabaseTableIfNeeded();
//    }
//    
//    lazy var documentsDirectoryFile: String = {
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let documentDirectory = paths[0]
//        let filePath = documentDirectory + self.kNameFile
//        return filePath
//    }()
//    
//    func createDatabaseTableIfNeeded() {
//        print("database path is: " + documentsDirectoryFile)
//        
//        if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//            assertionFailure("failed to open database")
//        } else {
//            print("succeed to open database")
//            var err: UnsafeMutablePointer<CChar>? = nil
//            let createSQL = "CREATE TABLE IF NOT EXISTS Feedback (userName TEXT PRIMARY KEY, feedback TEXT);"
//            
//            if sqlite3_exec(db, createSQL, nil, nil, &err) != SQLITE_OK {
//                assertionFailure("failed to create table, err: " + String(cString: err!))
//            } else {
//                print("succeed to create table")
//            }
//        }
//        sqlite3_close(db)
//    }
//    
//    func searchWithIdNum(_ userName: String?) -> FeedbackModel? {
//        var retModel: FeedbackModel?
//        if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//            assertionFailure("failed to open database")
//        } else {
//            print("succeed to open database")
//            let selectSQL = "SELECT * FROM Feedback where userName = ?;"
//            var stmt: OpaquePointer? = nil
//            
//            if sqlite3_prepare_v2(db, selectSQL, -1, &stmt, nil) == SQLITE_OK {
//                
//                sqlite3_bind_text(stmt, 1, userName ?? "", -1, nil)
//                
//                if sqlite3_step(stmt) == SQLITE_ROW {
//                   // let retfirstName = String(cString: sqlite3_column_text(stmt, 0))
//                   // let retlastName = String(cString: sqlite3_column_text(stmt, 1))
//                    let retuserName = String(cString: sqlite3_column_text(stmt, 0))
//                    let retFeedback = String(cString: sqlite3_column_text(stmt, 1))
//                   // let retretypePassword = String(cString: sqlite3_column_text(stmt, 4))
//                  //  let retemailId = String(cString: sqlite3_column_text(stmt, 5))
//                  //  let retcontact = String(cString: sqlite3_column_text(stmt, 6))
//                   // let retlanguage = String(cString: sqlite3_column_text(stmt, 7))
//                    retModel = FeedbackModel(userName: retuserName, feedback: retFeedback)
//                }
//            }
//            sqlite3_finalize(stmt)
//        }
//        sqlite3_close(db)
//        return retModel
//    }
//    
//    
//    func allItems() -> [FeedbackModel] {
//        var retModels = [FeedbackModel]()
//        if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//            assertionFailure("failed to open database")
//        } else {
//            print("succeed to open database")
//            let selectSQL = "SELECT * FROM Feedback;"
//            var stmt: OpaquePointer? = nil
//            
//            if sqlite3_prepare_v2(db, selectSQL, -1, &stmt, nil) == SQLITE_OK {
//                
//                while sqlite3_step(stmt) == SQLITE_ROW {
//                    //let retfirstName = String(cString: sqlite3_column_text(stmt, 0))
//                    //let retlastName = String(cString: sqlite3_column_text(stmt, 1))
//                    let retuserName = String(cString: sqlite3_column_text(stmt, 0))
//                    let retFeedback = String(cString: sqlite3_column_text(stmt, 1))
//                   // let retretypePassword = String(cString: sqlite3_column_text(stmt, 4))
//                    //let retemailId = String(cString: sqlite3_column_text(stmt, 5))
//                    //let retcontact = String(cString: sqlite3_column_text(stmt, 6))
//                   // let retlanguage = String(cString: sqlite3_column_text(stmt, 7))
//                    
//                    let model = FeedbackModel(userName: retuserName, feedback: retFeedback)
//                    retModels.append(model)
//                }
//            }
//            sqlite3_finalize(stmt)
//        }
//        sqlite3_close(db)
//        
//        return retModels
//    }
//    
//    func insert(_ model: FeedbackModel) -> Bool {
//        var flag = false
//        
//        if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//            assertionFailure("failed to open database")
//        } else {
//            print("succeed to open database")
//            let insertSQL = "INSERT OR REPLACE INTO Feedback (userName, feedback) VALUES (?, ?);"
//            var stmt: OpaquePointer? = nil
//            
//            if sqlite3_prepare_v2(db, insertSQL, -1, &stmt, nil) == SQLITE_OK {
//                
//               // let firstname1 = model.firstName.cString(using: .utf8)
//             //   let lastname1 = model.lastName.cString(using: .utf8)
//                let username1 = model.userName.cString(using: .utf8)
//                let feedback1 = model.feedback.cString(using: .utf8)
//             //   let retypepassword1 = model.retypePassword.cString(using: .utf8)
//               // let emailid1 = model.emailId.cString(using: .utf8)
//              //  let contact1 = model.contact.cString(using: .utf8)
//               // let language1 = model.language.cString(using: .utf8)
//                
//                sqlite3_bind_text(stmt, 1, username1!, -1, nil)
//                sqlite3_bind_text(stmt, 2, feedback1!, -1, nil)
//               // sqlite3_bind_text(stmt, 3, username1!, -1, nil)
//               // sqlite3_bind_text(stmt, 4, password1!, -1, nil)
//               // sqlite3_bind_text(stmt, 5, retypepassword1!, -1, nil)
//               // sqlite3_bind_text(stmt, 6, emailid1!, -1, nil)
//               // sqlite3_bind_text(stmt, 7, contact1!, -1, nil)
//               // sqlite3_bind_text(stmt, 8, language1!, -1, nil)
//                
//                if sqlite3_step(stmt) != SQLITE_DONE {
//                    assertionFailure("failed to insert data into the table")
//                } else {
//                    flag = true
//                }
//            }
//            sqlite3_finalize(stmt)
//        }
//        sqlite3_close(db)
//        return flag
//    }
//    
//    func deleteWithId(_ userName: String?) -> Bool {
//        var flag = false
//        
//        if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//            assertionFailure("failed to open database")
//        } else {
//            print("succeed to open database")
//            let deleteSQL = "DELETE FROM Feedback where userName = ?;"
//            var stmt: OpaquePointer? = nil
//            
//            if sqlite3_prepare_v2(db, deleteSQL, -1, &stmt, nil) == SQLITE_OK {
//                
//                sqlite3_bind_text(stmt, 1, userName ?? "", -1, nil)
//                
//                if sqlite3_step(stmt) != SQLITE_DONE {
//                    assertionFailure("failed to delete data from the table")
//                } else {
//                    flag = true
//                }
//            }
//            sqlite3_finalize(stmt)
//        }
//        sqlite3_close(db)
//        return flag
//    }
//    
//    
//    /*  func updateWithId(_ idNum: String, model: RegisterModel) -> Bool {
//     var flag = false
//     
//     if sqlite3_open(documentsDirectoryFile, &db) != SQLITE_OK {
//     assertionFailure("failed to open database")
//     } else {
//     print("succeed to open database")
//     let updateSQL = "UPDATE Register SET language = ?, contact = ? where userName = ?;"
//     var stmt: OpaquePointer? = nil
//     
//     if sqlite3_prepare_v2(db, updateSQL, -1, &stmt, nil) == SQLITE_OK {
//     
//     let id = model.idNum.cString(using: .utf8)
//     let name = model.name.cString(using: .utf8)
//     
//     sqlite3_bind_text(stmt, 1, id!, -1, nil)
//     sqlite3_bind_text(stmt, 2, name!, -1, nil)
//     
//     sqlite3_bind_text(stmt, 3, idNum, -1, nil)
//     
//     if sqlite3_step(stmt) != SQLITE_DONE {
//     assertionFailure("failed to update data in the table")
//     } else {
//     flag = true
//     }
//     }
//     sqlite3_finalize(stmt)
//     }
//     sqlite3_close(db)
//     return flag
//     }
//     */
//}
