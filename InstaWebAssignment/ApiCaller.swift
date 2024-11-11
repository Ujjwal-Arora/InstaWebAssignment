//
//  ApiCaller.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 12/11/24.
//

import Foundation

struct TempUser : Codable{
    var firstName: String
    var lastName: String
    var age: Int
}

class ApiCaller : ObservableObject {
    
    func fetchData(newUser: UserModel) async throws -> TempUser{
        guard let url = URL(string: "https://dummyjson.com/users/add") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
   //     let body = try JSONEncoder().encode(newUser)

        let body = try JSONEncoder().encode(TempUser(firstName: "Ujjwal", lastName: "Arora", age: 0))
    
        request.httpBody = body
        
        let (data,httpResponse) = try await URLSession.shared.data(for: request)
        
        guard let response = httpResponse as? HTTPURLResponse, response.statusCode == 201 else {throw URLError(.badServerResponse)}
        print("Status Code :",response.statusCode)
        
       // print(String(decoding: data, as: UTF8.self))
        let user = try JSONDecoder().decode(TempUser.self, from: data)
        print(user)
        return user
    }
}
