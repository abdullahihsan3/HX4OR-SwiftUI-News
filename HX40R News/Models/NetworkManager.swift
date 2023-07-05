//
//  NetworkManager.swift
//  HX40R News
//
//  Created by Abdullah Ihsan on 03/07/2023.
//

import Foundation

class NetworkManager : ObservableObject{
    @Published var postsHits = [Hit]()
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results =  try decoder.decode(NewsModel.self, from: safeData)
                            self.postsHits = results.hits
                        } catch{
                            print(error)
                        }
                        
                    }
                
                }
            }
            task.resume()
        }
        
    }
}
