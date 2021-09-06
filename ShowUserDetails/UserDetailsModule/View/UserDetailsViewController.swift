//
//  UserDetailsViewController.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var userDetails: UserListViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    
    
    func  setUpView() {
        
        self.title = "UserDetails"
        
        let name:UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let userName:UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let email:UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let address:UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let phone:UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let company :UILabel = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            return field
        }()
        
        let mainStack: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 30
            stack.alignment = .leading
            stack.distribution = .fillProportionally
            return stack
        }()
        
        name.text = "Name: \(userDetails.name)"
        userName.text = "UserName : \(userDetails.username)"
        email.text = "email: \(userDetails.email)"
        address.text = "Address: \(userDetails.address?.city ?? "" )"
        phone.text = "Phone: \(userDetails.phone)"
        company.text = "Company: \(userDetails.company?.name ?? "" )"
        
        mainStack.addArrangedSubview(name)
        mainStack.addArrangedSubview(userName)
        mainStack.addArrangedSubview(email)
        mainStack.addArrangedSubview(address)
        mainStack.addArrangedSubview(phone)
        mainStack.addArrangedSubview(company)
        
        self.view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
        ])
        
    }
}
