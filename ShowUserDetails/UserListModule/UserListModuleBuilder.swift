//
//  UserListModuleBuilder.swift
//  OpenTrents_MachineTest
//
//  Created by Arunraj on 02/08/21.
//

import Foundation
import UIKit


class UserListModuleBuilder {
    
    init() {
        
    }
    
    
    func build() -> UIViewController{
        
        let view = UserListViewController()
        
        let service = UserListHttpService()
        
        let interactor = UserListInteractor(service: service)
        
        let router = UserListRouter(view: view)
        
        let presenter  = UserListPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        return view
        
        
    }
}
