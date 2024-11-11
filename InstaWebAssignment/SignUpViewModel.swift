//
//  SignUpViewModel.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 12/11/24.
//

import Foundation

@MainActor
class SignUpViewModel: ObservableObject{
    @Published var nameTextField: String = ""
    @Published var cityTextField: String = ""
    @Published var phoneTextField: String = ""
    @Published var addressTextField: String = ""
    @Published var pinCodeTextField: String = ""
    @Published var showAddressOnWebsite: Bool = true
    @Published var websiteCategory: WebsiteCategory = .localBusiness
    
    @Published var user : TempUser?
    
    func fetchUser() async{
        let newUser = UserModel(name: nameTextField, city: cityTextField, phone: phoneTextField, address: addressTextField, pinCode: pinCodeTextField, showAddressOnWebsite: showAddressOnWebsite, websiteCategory: websiteCategory)

        do{
            self.user = try await ApiCaller().fetchData(newUser: newUser)
            
            saveUserToUserDefaults()
        }catch{
            print("error fetching user : ",error.localizedDescription)
        }
    }
    
    func saveUserToUserDefaults(){
        guard let user, let encodedUser = try? JSONEncoder().encode(user) else{return}
        
        UserDefaults.standard.set(encodedUser, forKey: "savedUserKey")
    }
    func loadUserFromUserDefaults(){
        guard let encodedUser = UserDefaults.standard.data(forKey: "savedUserKey") else{ return }
        
        guard let savedUser = try? JSONDecoder().decode(TempUser.self, from: encodedUser) else{ return }
        
        self.user = savedUser
    
    }

}
