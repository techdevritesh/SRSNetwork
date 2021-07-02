//
//  APIRouter.swift
//  SRSNetwork
//
//  Created by Ritesh on 01/06/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case allTasks
    case task(id: Int)
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .allTasks:
            return .get
        case .task:
            return .get
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .allTasks:
            return "/Task"
        case .task(let id):
            return "/Task/\(id)"
        }
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .allTasks:
            return nil
        case .task:
            return nil
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try KConst.ProductionServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
