//
//  APIClient.swift
//  coinswap
//
//  Created by vladislav mallouny on 18.11.2025.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case badResponse(statusCode: Int)
    case noData
}

final class APIClient {
    private let baseURL = URL(string: "https://pro-api.coinmarketcap.com")!
    private let apiKey: String
    private let session: URLSession
    
    init(apiKey: String, session: URLSession = .shared) {
        self.apiKey = apiKey
        self.session = session
    }

    func get(path: String, queryItems: [URLQueryItem] = []) async throws -> Data {
        // URL
        var components = URLComponents()
        components.scheme = baseURL.scheme
        components.host = baseURL.host(percentEncoded: false)
        components.path = path.hasPrefix("/") ? path : "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        // JOIN REQUEST
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        // REQUEST
        
        let (data, response) = try await session.data(for: request)
        
        // CHECK HTTP CODE
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.badResponse(statusCode: -1)
        }
        
        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw APIError.badResponse(statusCode: httpResponse.statusCode)
        }
        
        guard !data.isEmpty else {
            throw APIError.noData
        }
        
        return data
    }
}
