//
//  InstaWebAssignmentApp.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 11/11/24.
//

import SwiftUI

@main
struct InstaWebAssignmentApp: App {
    @StateObject var vm = SignUpViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if vm.user == nil{
                    SignUpView()
                }else{
                    NextView()
                }
            }
            .environmentObject(vm)
            .onAppear {
                vm.loadUserFromUserDefaults()
            }

        }
    }
}
