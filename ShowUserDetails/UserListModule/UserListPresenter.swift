//
//  UserListPresenter.swift
//  OpenTrents_MachineTest
//
//  Created by Arunraj on 02/08/21.
//

import Foundation

protocol UserListPresentation {
    
    func loadList(pageNumber: Int)
    
    func showUserDetails(with data: UserListViewModel)
}

class UserListPresenter: UserListPresentation {
   
    weak var view: UserListViewController?
    
    let router: UserListRouting
    let interactor: UserListUseCases
    
    init(view: UserListViewController, router: UserListRouting, interactor: UserListUseCases) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    
    public func loadList(pageNumber: Int){
        
        interactor.getList(pageNumber: pageNumber) {[weak self] responce in
            
            guard let `self` = self else {return}
            
            switch responce{
            
            case .success(let dataList):
                
                if dataList.isEmpty {
                    print("Empty List")
                }else{
                    self.view?.loadList(list: dataList)
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func showUserDetails(with data: UserListViewModel) {
        
        self.router.showUserDetails(with: data)
        
    }
        
}
