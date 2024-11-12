//
//  DefaultInputBoxView.swift
//  InstaWebAssignment
//
//  Created by Ujjwal Arora on 12/11/24.
//

import SwiftUI

struct DefaultInputBoxView: View {
    var title : String
    var subtitle : String
    @Binding var textFieldValue : String
    
    var body: some View {
        VStack(alignment: .leading, spacing : 10) {
            Text(title)
                .foregroundStyle(.accent)
                .fontWeight(.semibold)

            TextField(title, text: $textFieldValue)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.cyan.opacity(0.1)) 
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.secondary)

        }.padding(.vertical,8)
    }
}

#Preview {
    DefaultInputBoxView(title: "City", subtitle: "Enter you current city so that nearby visitors can find you on search engines", textFieldValue: .constant(""))
}
