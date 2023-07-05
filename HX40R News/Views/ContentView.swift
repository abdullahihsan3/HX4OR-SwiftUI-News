//
//  ContentView.swift
//  HX40R News
//
//  Created by Abdullah Ihsan on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.postsHits) { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationTitle("H4XOR NEWS")
        }.onAppear{
            self.networkManager.fetchData()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post : Identifiable{
    let id: String
    let title: String
}
let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Bonjour"),
    Post(id: "3", title: "Hola"),
]
