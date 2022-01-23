//
//  NetworkService.swift
//  Movies
//
//  Created by A101Mac on 23.01.2022.
//

import Foundation
class NetworkService {
    
    
    static let shared = NetworkService()
    
    
    
    func getMovies (url : UrlPath,parameter : String , completionHandler : @escaping (Result<MoviesModel, NetworkError>) -> Void) {
        guard let url = URL(string: url.rawValue.appending(parameter))
                
                
            
        else {
            return completionHandler(.failure(.invalidUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(response.debugDescription)
            if data == data , error == nil {
//                success
                
                guard let response = try? JSONDecoder().decode(MoviesModel.self, from: data!)
                else {
                    return completionHandler(.failure(.parseError))
                }
                completionHandler(.success(response))
                
            }
            else {
//                fail
                completionHandler(.failure(.networkError))
            }
            
            
        }.resume()
        
        
    }
    func getMovieDetail (url : UrlPath,parameter : String , completionHandler : @escaping (Result<MoviesDetailModel, NetworkError>) -> Void) {
       
        guard let url = URL(string: url.rawValue.appending(parameter))
        else {
            return completionHandler(.failure(.invalidUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(response.debugDescription)
            if data == data , error == nil {
//                success
                
                guard let response = try? JSONDecoder().decode(MoviesDetailModel.self, from: data!)
                else {
                    return completionHandler(.failure(.parseError))
                }
                completionHandler(.success(response))
                
            }
            else {
//                fail
                completionHandler(.failure(.networkError))
            }
            
            
        }.resume()
        
        
    }
}

enum NetworkError : Error {
    case invalidUrl
    case networkError
    case parseError
}
enum UrlPath : String {
case searchMovies = "http://www.omdbapi.com/?apikey=fde639d3&s="
    case movieDetail = "http://www.omdbapi.com/?apikey=fde639d3&t="
}
