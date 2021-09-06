//
//  NetworkReachability.swift
//  ShowUserDetails
//
//  Created by Arunraj on 06/09/21.
//

import Foundation
import Reachability


class NetworkReachability {
    
    public static let instance = NetworkReachability()
    
    private init(){}
    
    
    
    let reachability = try! Reachability()
    
    
    func isNetwork()-> Bool{
        
        var status: Bool = false
        
        if reachability.isReachable {
            status = true
        }
        return status
    }
    
}
