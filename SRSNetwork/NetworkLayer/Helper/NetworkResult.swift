//
//  NetworkResult.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation

/// generic network result to get the data and error based on type.
public enum NetworkResult<D, E: Error> {
   case success(D)
   case error(E)
}
