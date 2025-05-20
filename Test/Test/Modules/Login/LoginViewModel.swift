//
//  LoginViewModel.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var phone: String = "+375"
    @Published var password: String = ""
    @Published var showProfile: Bool = false
    @Published var profile: ProfileResponse?
    @Published var errorMessage: String?

    func login() async {
        do {
            let response = try await APIServiceManager.shared.login(phone: phone, password: password)
            TokenStorageManager.save(token: response.accessToken)
            try await fetchProfile()
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
        }
    }

    func fetchProfile() async throws {
        do {
            let profile = try await APIServiceManager.shared.fetchProfile()
            self.profile = profile
            showProfile.toggle()
        } catch {
            errorMessage = "Profile error"
        }
    }
}
