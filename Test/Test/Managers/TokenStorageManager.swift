//
//  TokenStorageManager.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import Foundation

final class TokenStorageManager {
    private static let key = "accessToken"

    static func save(token: String) {
        UserDefaults.standard.set(token, forKey: key)
    }

    static func load() -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
}
