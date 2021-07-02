//
//  Request.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
public typealias Params = [String: String]
public typealias Headers = [String: String]

public struct Request {
    var api: API
    var method: HTTPMethods = .get
    var headers: Headers?
    var params: Params?
    public init(api: API, method: HTTPMethods, headers: Headers? = nil, params: Params? = nil) {
        self.api = api
        self.method = method
        self.headers = headers
        self.params = params
    }
}

public enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
