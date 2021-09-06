//
//  UserListInteractor.swift
//  OpenTrents_MachineTest
//
//  Created by Arunraj on 02/08/21.
//

import Foundation

protocol UserListUseCases {
    
    func getList(pageNumber: Int,completionHandler: @escaping (Result<[UserListViewModel], Error>)->())
    
}

class UserListInteractor: UserListUseCases {
   
    let service: UserListService
    
    init(service : UserListService) {
        self.service = service
    }
    
    func getList(pageNumber: Int,completionHandler: @escaping (Result<[UserListViewModel], Error>)->()){
        
        if NetworkReachability.instance.isNetwork(){
            
            service.fetchList(pageNumber: pageNumber) { responce in
                
                switch responce{
                
                case .success(let list):
                    
                    list.forEach { item in
                        CoreDataManager.instance.save(data: item)
                    }
                    
                    self.fetchData { response in
                        switch response{
                        case .success(let list):
                            completionHandler(.success(list))

                        case .failure(_):
                            break
                        }
                    }
                    
                    let viewModel = list.map({UserListViewModel(model: $0)})
                    
                    completionHandler(.success(viewModel))
                case .failure(_):
                    break
                }
            }
        } 
        else{
            fetchData { response in
                switch response{
                case .success(let list):
                    completionHandler(.success(list))

                case .failure(_):
                    break
                }
            }
        }
    }
    
    
    
    
    func fetchData(completionHandler: @escaping (Result<[UserListViewModel], Error>)->()) {
        CoreDataManager.instance.fetchData { response in
            switch response{
            
            case .success(let data):
                
                
                let userList = data as? [Users]
                
                var newData:[UserListViewModel] = []
                
                userList?.forEach({ item in
                    
                    let new = UserListViewModel(   id: Int(item.id),
                                                   name:  item.name ?? "",
                                                   username: item.username ?? "",
                                                   email:  item.email ?? "",
                                                   address: nil,
                                                   phone: item.phone ?? "",
                                                   website: item.website ?? "",
                                                   company: nil)
                    
                    
                    newData.append(new)
                })
                
                
                print(newData)
                
                completionHandler(.success(newData))
                
            case .failure(_):
                print("Coredata Fetch error")
            }
        }
    }
    
}
