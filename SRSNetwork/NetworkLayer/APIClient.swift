//
//  APIClient.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

open class APIClient {
    static public func callAPI<T>(completion: @escaping (Result<T?>) -> Void) where T: Codable {
        do {
            let request = try APIRouter.allTasks.asURLRequest()
            Alamofire.request(request).responseData(completionHandler: {response in
                switch response.result {
                case .success(let res):
                    if let code = response.response?.statusCode {
                        switch code {
                        case 200...299:
                            do {
                                completion(.success(try JSONDecoder().decode(T.self, from: res)))
                            } catch let error {
                                print(String(data: res, encoding: .utf8) ?? "nothing received")
                                completion(.failure(error))
                            }
                        default:
                         let error = NSError(domain: response.debugDescription,
                                             code: code,
                                             userInfo: response.response?.allHeaderFields as? [String: Any])
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        } catch let error {
            print("Error \(error)")
            completion(.failure(error))
        }
    }
}
