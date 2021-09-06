//
//  UserListViewModel.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import Foundation


struct UserListViewModel {
    
    let id: Int
    let name, username, email: String
    let address: Address?
    let phone, website: String
    let company: Company?
    
    init(id: Int,
         name: String, username: String, email: String,
         address: Address?,
         phone: String, website: String,
         company: Company?) {
        self.id  = id
        self.name  = name
        self.username  = username
        self.email  = email
        self.address  = address
        self.phone  = phone
        self.website  = website
        self.company  = company
    }
    
    init(model: UserDetails) {
        self.id  = model.id
        self.name  = model.name
        self.username  = model.username
        self.email  = model.email
        self.address  = model.address
        self.phone  = model.phone
        self.website  = model.website
        self.company  = model.company
    }
}
