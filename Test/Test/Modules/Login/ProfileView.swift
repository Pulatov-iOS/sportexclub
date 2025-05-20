//
//  ProfileView.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import SwiftUI

struct ProfileView: View {
    let profile: ProfileResponse?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Welcome!")
                .font(.system(size: 24, weight: .regular))
                .foregroundStyle(.white.opacity(0.8))
            
            if let profile = profile {
                Text(profile.fullName)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.bottom, 15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.Colors.customBlue))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView(profile: nil)
}
