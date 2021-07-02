//
//  API.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
public struct API {
    let baseURL: BaseURL
    let path: [String]
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
    public var url: URL {
        var components = URLComponents()
        components.scheme = self.baseURL.scheme
        components.host = self.baseURL.host
        components.port = self.baseURL.port
        components.path = "/" + self.path.joined(separator: "/")
        return components.url!
    }
}
