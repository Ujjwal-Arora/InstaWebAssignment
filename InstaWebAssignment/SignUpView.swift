//
//  ContentView.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 11/11/24.
//

import SwiftUI

struct SignUpView: View {

    @EnvironmentObject private var vm : SignUpViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView {
                DefaultInputBoxView(title: "Website title eg : InstaWeb labs", subtitle: "Enter your website title/Business name/Store Name/Blog name", textFieldValue: $vm.nameTextField)
                
                VStack(alignment: .leading, spacing : 10) {
                    Text("Website Category")
                        .foregroundStyle(.accent)
                        .fontWeight(.semibold)
                    
                    Picker("Website Category", selection: $vm.websiteCategory) {
                        ForEach(WebsiteCategory.allCases,id: \.self){ category in
                            Text(category.rawValue)
                            
                        }
                    }
                    .padding(6)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(.cyan.opacity(0.1)) 
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                    
                    Text("Select the category in which your website operates")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                }
                .padding(.vertical,8)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing : 10) {
                    Text("City")
                        .foregroundStyle(.accent)
                        .fontWeight(.semibold)
                    
                    TextField("City", text: $vm.cityTextField)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.cyan.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
                    
                    Text("Enter you current city so that nearby visitors can find you on search engines")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                }
                DefaultInputBoxView(title: "Phone", subtitle: "Enter a valid phone number so that viewers can contact you", textFieldValue: $vm.phoneTextField)
                
                DefaultInputBoxView(title: "Address", subtitle: "Build your credibility & reputation by entering your address", textFieldValue: $vm.addressTextField)
                
                DefaultInputBoxView(title: "Pin Code", subtitle: "", textFieldValue: $vm.pinCodeTextField)
                
                Toggle("Show Address on Website", isOn: $vm.showAddressOnWebsite)
                    .font(.footnote)
                
                
                Button {
                    Task{
                        await vm.fetchUser()
                    }
                } label: {
                    Text("Launch Your Website")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top)
                }
                
            }
            .scrollIndicators(.never)
            .padding()
        }
        .navigationTitle("Let's setup your website")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationStack {
        SignUpView()
            .environmentObject(SignUpViewModel())
    }
}
