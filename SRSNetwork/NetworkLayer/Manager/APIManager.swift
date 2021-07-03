//
//  APIManager.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
import Alamofire

open class APIManager: NetworkManager {
    public init() {}
    private func getHTTPMethod(method: HTTPMethods) -> HTTPMethod {
        return (method == .get) ? .get : .post
    }
    public func request<E>(request: E,
                           completion: @escaping ((NetworkResult<E.Response, NetworkError>) -> Void))
    where E: RequestProvider {
        if NetworkReachabilityManager()!.isReachable {
            Alamofire.request(
                request.request.api.url,
                method: self.getHTTPMethod(method: request.request.method),
                parameters: request.request.params,
                encoding: URLEncoding.default,
                headers: request.request.headers
                )
                .responseJSON { (response) in
                    if let error = response.result.error {
                        completion(.error(NetworkError.server(error)))
                    } else if let data = response.result.value {
                        let response: E.Response = data
                        completion(.success(response))
                    }
                }
        } else {
            completion(.error(NetworkError.internetError("No Internet Conncection")))
        }
    }
}
