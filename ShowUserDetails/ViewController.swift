//
//  ViewController.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UserListModuleBuilder().build()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

