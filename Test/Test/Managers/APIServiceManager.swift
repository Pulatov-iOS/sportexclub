//
//  APIServiceManager.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import Foundation

final class APIServiceManager {
    static let shared = APIServiceManager()
    private let baseURL = "https://mobile.demosportex.online"

    private func makeRequest(path: String, method: String = "GET", body: Data? = nil, token: String? = nil) -> URLRequest {
        let url = URL(string: baseURL + path) ?? URL(filePath: "")
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("2", forHTTPHeaderField: "clubId")
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let body = body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        }
        return request
    }

    func login(phone: String, password: String) async throws -> LoginResponse {
        let requestModel = LoginRequest(phone: phone, password: password)
        let body = try JSONEncoder().encode(requestModel)
        let request = makeRequest(path: "/api/v1.0/auth/login/", method: "POST", body: body)

        let (data, _) = try await URLSession.shared.data(for: request)
        let wrapper = try JSONDecoder().decode(LoginWrapperResponse.self, from: data)
        CoreDataManager.shared.saveLoginResponse(wrapper.data)

        return wrapper.data
    }

    func fetchProfile() async throws -> ProfileResponse {
        guard let token = TokenStorageManager.load() else {
            throw URLError(.userAuthenticationRequired)
        }

        let request = makeRequest(path: "/api/v1.0/profile/", token: token)
        let (data, _) = try await URLSession.shared.data(for: request)

        let wrapper = try JSONDecoder().decode(ProfileWrapperResponse.self, from: data)
        return wrapper.data
    }
}
