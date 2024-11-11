//
//  NextView.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 12/11/24.
//

import SwiftUI

struct NextView: View {
    @EnvironmentObject var vm: SignUpViewModel
    
    var body: some View {
        Text("Hello \(vm.user?.firstName ?? "No Name")")
            .navigationTitle("Next View")
    }
}

#Preview {
    NextView()
        .environmentObject(SignUpViewModel())
}
