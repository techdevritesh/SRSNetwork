//
//  BaseURL.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
public struct BaseURL {
    let scheme: String
    let host: String
    let port: Int?
    public init(scheme: String, host: String, port: Int? = nil) {
        self.scheme = scheme
        self.host = host.removingPercentEncoding ?? host
        self.port = port
    }
}
