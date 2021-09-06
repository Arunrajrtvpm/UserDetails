//
//  UserListViewCell.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import Foundation
import UIKit

class UserListViewCell: UITableViewCell {
    
    public var userDetails: UserListViewModel!
    
    var name:UILabel!
    var phone:UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setUpCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        name.text = userDetails.name
        phone.text = "Phone:  \(userDetails.phone)"
    }
    
    func  setUpCellView() {
        
         name = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 25.0)
            return field
        }()
        
         phone = {
            let field = UILabel(frame: .zero)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.font = UIFont.systemFont(ofSize: 20.0)
            field.textColor = .blue
            return field
        }()
        
        
        
        let mainStack: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 10
            stack.alignment = .leading
            stack.distribution = .fillProportionally
            stack.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.9)
            return stack
        }()
        
        mainStack.layoutMargins = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 0)
        mainStack.isLayoutMarginsRelativeArrangement = true
        
        self.contentView.addSubview(mainStack)
        
        mainStack.addArrangedSubview(name)
        mainStack.addArrangedSubview(phone)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            mainStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            mainStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            mainStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
        ])
    }
}
