//
//  UserListService.swift
//  OpenTrents_MachineTest
//
//  Created by Arunraj on 02/08/21.
//

import Foundation
import Alamofire

protocol UserListService {
    func fetchList(pageNumber: Int, completionHandler: @escaping (Result<[UserDetails], Error>)->())
        
}

class UserListHttpService: UserListService {
    
    func fetchList(pageNumber: Int, completionHandler: @escaping (Result<[UserDetails], Error>)->())  {
                
        DispatchQueue.global(qos: .background).async {
            
            AF.request("https://jsonplaceholder.typicode.com/users").responseData { response in
                
                switch response.result{
                
                case .success(let data):
                    do{
                        
                        let listData = try JSONDecoder().decode([UserDetails].self, from: data)
                        completionHandler(.success(listData))
                            print(listData)
                    }
                    catch let error{
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                    print(error)
                }
            }
        }
    }
   
}
