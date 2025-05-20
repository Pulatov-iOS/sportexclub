//
//  ApiModels.swift
//  Test
//
//  Created by Alexander on 20.05.25.
//

import Foundation

struct LoginRequest: Codable {
    let phone: String
    let password: String
}

struct LoginWrapperResponse: Codable {
    let status: Int
    let data: LoginResponse
    let error: String?
}

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expires: String
    let accessTokenHash: String
    let language: String
}

struct ProfileWrapperResponse: Codable {
    let status: Int
    let data: ProfileResponse
    let error: String?
}

struct ProfileResponse: Codable {
    let userId: Int
    let username: String
    let fullName: String
    let phoneNumber: String
    let email: String?
    let avatar: String?
    let language: String
    let userBalance: [String: Double]
    let clubsInfoList: [ClubInfo]
    let timer: String?
    let coins: Double
    let exp: Double
}

struct ClubInfo: Codable {
    let clubId: Int
    let coalitionId: Int?
    let isCoalitionOwner: Bool
    let isModerator: Bool
    let userStatusInClubId: Int
    let userStatusInClub: String
    let unreadChatMessage: Int
    let noticeDeleteDate: String
    let tokens: Int
    let subscriptions: [Subscription]
    let tokensInfo: TokensInfo
}

struct Subscription: Codable {
    let id: String
    let slug: String
    let status: String
}

struct TokensInfo: Codable {
    let countPlayers: Int
    let countTrainers: Int
    let countDirectors: Int
    let countOwners: Int
    let countAllTokens: Int
}
