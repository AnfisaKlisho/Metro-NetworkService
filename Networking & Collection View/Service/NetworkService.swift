//
//  NetworkService.swift
//  Networking & Collection View
//
//  Created by Anfisa Klisho on 02.12.2020.
//

import Foundation

class NetworkService{
    
//MARK:- change posts to smth
    static func loadPosts(completion: @escaping ([City], Error?) -> Void){
        
        let url = URL(string: "https://api.hh.ru/metro/1")!
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error)
                DispatchQueue.main.async {
                    completion([], error)
                }
            return
                    
        }
        
        
        
        
        let response = response as! HTTPURLResponse
        guard let data = data else{
            let error = NSError(domain: "Data error occured. esponse status code: \(response.statusCode)", code: response.statusCode, userInfo: nil)
            DispatchQueue.main.async {
                completion([], error)
            }
            print("Data error occured. esponse status code: \(response.statusCode)")
            return
        }
          
            do {
                let city = try JSONDecoder().decode(City.self, from: data)
                
                DispatchQueue.main.async {
                    completion([city], nil)
                }
            }
            
            catch (let jsonError){
                print(jsonError)
                DispatchQueue.main.async {
                    completion([], nil)
                }
            }
        }
        
    }
       
}


