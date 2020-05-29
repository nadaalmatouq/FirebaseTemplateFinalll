//
//  Item.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import Foundation


struct Item: Codable, Hashable{
    var name: String
    var price: Double
}

struct userModel: Codable, Hashable{
    var uid : String
    var email: String
    var firstname: String
    var lastname: String
    var phoneNumber: String
    var userType : String
    var date : String?
    
}
struct TravelModel: Codable, Hashable, Identifiable{
    var id : String
    var email: String
    var firstname: String
    var lastname: String
    var phoneNumber: String
    var userType : String
    var date : String?
    
}
