//
//  UserModel.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 12/11/24.
//

import Foundation

struct UserModel : Codable {
   let name: String
   let city: String
   let phone: String
   let address: String
   let pinCode: String
   let showAddressOnWebsite: Bool
   let websiteCategory: WebsiteCategory

}
