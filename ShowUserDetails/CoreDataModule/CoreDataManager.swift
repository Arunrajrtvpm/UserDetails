//
//  CoreDataManager.swift
//  ProductApp
//
//  Created by Arunraj on 27/08/21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    public static let instance = CoreDataManager()
    
    private init(){}
    
    func fetchData(completionHandler: (Result<[NSManagedObject], Error>)->()) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        
        do {
            let value = try managedContext.fetch(fetchRequest) 
            completionHandler(.success(value))
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func save(data: UserDetails) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Users",
                                       in: managedContext)!
  
        let productList = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
        
        productList.setValue(data.id, forKeyPath: "id")
        productList.setValue(data.name, forKeyPath: "name")
        productList.setValue(data.username, forKeyPath: "username")
        productList.setValue(data.email, forKeyPath: "email")
        productList.setValue(data.phone, forKeyPath: "phone")
        productList.setValue(data.website, forKeyPath: "website")
        
//        productList.setValue(data.id, forKeyPath: "company")
//        productList.setValue(data.id, forKeyPath: "address")
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
