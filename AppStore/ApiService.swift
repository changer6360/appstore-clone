//
//  ApiService.swift
//  AppStore
//
//  Created by Tihomir Videnov on 11/12/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import Foundation

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
     func fetchFeaturedApps(completionHandler: @escaping (FeaturedApps) -> ()) {
        
        let urlString = "https://dl.dropboxusercontent.com/u/48453924/appStore%3Afeatured.json"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                print(json)
                let featuredApps = FeaturedApps()
                featuredApps.setValuesForKeys(json)
                
                DispatchQueue.main.async {
                    completionHandler(featuredApps)
                }
                
            } catch let err {
                print(err)
            }
            
            }.resume()
    }
    
    func fetchAppDetails(id: Int, completionHandler: @escaping (App) -> ()) {
        
        let urlString = "http://www.statsallday.com/appstore/appdetail?id=\(id)"
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
    
                let appDetail = App()
                appDetail.setValuesForKeys(json)
            
                
                DispatchQueue.main.async {
                    completionHandler(appDetail)
                }
                
            } catch let err {
                print(err)
            }
            
        }).resume()
    }
    
    
  
}
