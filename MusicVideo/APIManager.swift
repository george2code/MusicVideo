//
//  APIManager.swift
//  MusicVideo
//
//  Created by Yuri on 10/18/16.
//  Copyright © 2016 fusta. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString: String, completion: @escaping (String) -> Void) {
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        
//        let session = URLSession.shared
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url);
        request.httpMethod = "POST"
        
        
        let task = session.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error!.localizedDescription)
                DispatchQueue.main.sync(execute: {
                    completion(error!.localizedDescription)
                })
                
            } else {
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject]
                    
                    print(json)
            
                    
                    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                        completion("JSONSerialization Successful")
                    }
                    
                    
                } catch {
                    DispatchQueue.main.async(execute: {
                        completion("error in JSONSerialization")
                    })
                }
                
                
                
//                DispatchQueue.main.async(execute: {
//                    completion("NSURLSession successful")
//                })
            }
            
            
            
            
        }
        task.resume()
    
        
    }
}
