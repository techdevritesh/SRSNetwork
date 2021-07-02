//
//  NetworkManager.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
protocol NetworkManager {
    func request<E: RequestProvider>(request: E,
                                     completion: @escaping ((NetworkResult<E.Response, NetworkError>) -> Void))
}
