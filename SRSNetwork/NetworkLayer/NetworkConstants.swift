//
//  NetworkConstants.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

struct KConst {
    struct ProductionServer {
        static let baseURL = "https://60b5ee34fe923b0017c84ee4.mockapi.io/api/v1"
    }
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
