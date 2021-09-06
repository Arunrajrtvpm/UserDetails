//
//  UserListRouter.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import Foundation
import UIKit

protocol UserListRouting {
    func showUserDetails(with details: UserListViewModel)
}

class UserListRouter: UserListRouting {
    
    let view: UserListView
    
    init(view: UserListViewController) {
        self.view = view
    }
    
    
    func showUserDetails(with details: UserListViewModel) {
         
        let vc = UserDetailsViewController()
        vc.userDetails = details
        
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.barTintColor = .lightGray
        nav.modalPresentationStyle = .formSheet
        nav.view.backgroundColor = .white
        
        let popup = nav.popoverPresentationController
        popup?.permittedArrowDirections = .init(rawValue: 0)
        (self.view as! UIViewController).present(nav, animated: true, completion: nil)
        
    }
    
}
