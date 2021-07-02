//
//  NetworkError.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation

public enum NetworkError: Error {
    case requestCreation
    case server(Error)
    case internetError(String)
}
