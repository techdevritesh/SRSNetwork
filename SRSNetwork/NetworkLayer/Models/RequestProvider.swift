//
//  RequestProvider.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
import ObjectMapper

public protocol RequestProvider {
    typealias Response = Any
    var request: Request { get }
}
