//
//  DatabaseManager.swift
//  Assignment
//
//  Created by Sameer Jain on 04/08/24.
//

import Foundation
import SQLite3

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("UserDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        }
    }
    
    private func createTable() {
        let createTableString = """
        CREATE TABLE IF NOT EXISTS User(
        Id INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT,
        Email TEXT UNIQUE,
        Password TEXT);
        """
        
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("User table created.")
            } else {
                print("User table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertUser(name: String, email: String, password: String) -> Bool{
        let insertStatementString = "INSERT INTO User (Name, Email, Password) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
                return false
            }
        } else {
            print("INSERT statement could not be prepared.")
            return false
        }
        sqlite3_finalize(insertStatement)
        return true
    }
    
    func fetchUser(email: String, password: String) -> Bool {
        let queryStatementString = "SELECT * FROM User WHERE Email = ? AND Password = ?;"
        var queryStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                print("Query Result:")
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                print("\(id) | \(name)")
                sqlite3_finalize(queryStatement)
                return true
            } else {
                print("Query returned no results.")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return false
    }
}

