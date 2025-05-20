//
//  LoginView.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("phone")
                .frame(width: 326, alignment: .leading)
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(.black.opacity(0.3))
                .padding(.top, 16)
                .padding(.bottom, 3)
            
            TextField("Number", text: $viewModel.phone)
                .padding()
                .frame(width: 326, height: 33)
                .background(.black.opacity(0.1))
                .border(.black.opacity(0.05), width: 1)
            
            Text("password")
                .frame(width: 326, alignment: .leading)
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(.black.opacity(0.3))
                .padding(.top, 10)
                .padding(.bottom, 3)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .keyboardType(.phonePad)
                .frame(width: 326, height: 33)
                .background(.black.opacity(0.1))
                .border(.black.opacity(0.05), width: 1)
            
            VStack(spacing: 0) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Button {
                        isLoading = true
                        Task {
                            await viewModel.login()
                            isLoading = false
                        }
                    } label: {
                        VStack {
                            Text("Log In")
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        .frame(width: 326, height: 33)
                        .background(viewModel.phone.count > 0 && viewModel.password.count > 0 ? Color(.Colors.customBlue) : Color(.Colors.customLightBlue))
                    }
                }
            }
            .frame(width: 326, height: 33)
            .padding(.top, 32)
            
            Spacer()
        }
        .frame(width: 358, height: 205)
        .background(.black.opacity(0.05))
        .border(.black.opacity(0.05), width: 1)
        .navigationDestination(isPresented: $viewModel.showProfile) {
            ProfileView(profile: viewModel.profile)
        }
    }
}

#Preview {
    LoginView()
}
