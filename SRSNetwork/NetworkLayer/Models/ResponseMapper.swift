//
//  ResponseMapper.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
import ObjectMapper
public protocol ResponseMapper: class {
    associatedtype Response
    static func map(data: Any) -> [Response]
}
