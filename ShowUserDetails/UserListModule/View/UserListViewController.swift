//
//  UserListViewController.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import UIKit

protocol UserListView: AnyObject {
    func loadList(list: [UserListViewModel])
}

class UserListViewController: UIViewController, UserListView {
    
    var tableView: UITableView!
    var list: [UserListViewModel] = []
    
    var presenter: UserListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter.loadList(pageNumber: 0)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews()  {
        
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true

        tableView = {
            
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UserListViewCell.self, forCellReuseIdentifier: "UserListViewCell")
            return tableView
        }()
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
        
    }
    
    
    func loadList(list: [UserListViewModel])  {
        self.list = list
        self.tableView.reloadData()
        
    }
    
}

extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  self.list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserListViewCell", for: indexPath) as! UserListViewCell
    let item = self.list[indexPath.item]
    cell.userDetails = item
    return cell
    
   }
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.showUserDetails(with: self.list[indexPath.row])
    }
    
   
}
