//
//  ContentView.swift
//  FakeFiverr
//
//  Created by Vincent He on 2020-10-25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var gigs = [GigsContent]()
    @State private var solidWork = [GigsContent]()
    @State private var pageIndex = 1 // This would be need for laster
    @State private var show_more = 1
    @State private var showRecommendationCount = 10
    @State private var solidworkspageIndex = 1
    @State private var serachText:String = "What are you seraching for"
    
    private var domain = "https://f4ecafcc9272.ngrok.io"
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack{
                    //The top picks one for fiverr
                    HStack{
                        Text("Top Picks")
                            .lineLimit(nil)
                        
                        NavigationLink(destination: Text("Placeholder")){
                            Text("View More")
                        }
                        
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top) {
                            ForEach(gigs){ gig in
                                VStack {
                                    Spacer()
                                    
                                    NavigationLink(destination: BuyerGigView(
                                        gig_title: gig.Title
                                    )){
                                        PostGigView(gig_image: gig.Gig_Picture, gig_title: gig.Title, seller_img: gig.Seler_Picure)
                                        
                                    }
                                    Spacer()
                                }
                            }
                            
                            VStack {
                                Spacer()
                                
                                Button(action:{
                                    self.pageIndex +=  1
                                    self.getPosts()
                                }){
                                    Text("Show More...")
                                }
                                Spacer()
                            }
                            
                        }
                        .frame(height:200).padding(10)
                        
                    }
                   
                    Spacer()
                    
                    // The solidworks part of the fake fiverr
                    HStack{
                        Text("Since You Search SolidWorks")
                        
                        NavigationLink(destination: Text("PlaceHolder") ){
                            Text("View More")
                        }
                        
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(self.solidWork){ gig in
                                VStack {
                                    Spacer()
                                    
                                    NavigationLink(destination: BuyerGigView(
                                        gig_title: gig.Title
                                    )){
                                        PostGigView(gig_image: gig.Gig_Picture, gig_title: gig.Title, seller_img: gig.Seler_Picure)
                                        
                                    }
                                    Spacer()
                                }
                            }
                            
                            VStack {
                                Spacer()
                                
                                Button(action:{
                                    self.solidworkspageIndex +=  1
                                    self.getSolidWorkPosts()
                                }){
                                    Text("Show More...")
                                }
                                Spacer()
                            }
                        }
                        
                    }
                    Spacer()
                        
                    .onAppear{
                        self.getPosts()
                        self.getSolidWorkPosts()
                    }
                    
                }
            }
            .navigationBarTitle("Fake Fiverr")
        }
    }
    
    
    
    func getPosts() {
        guard let url = URL(string: "\(self.domain)/api/\(self.pageIndex)") else { // Stop the code from running crash
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                if let posts = try? JSONDecoder().decode(Results.self, from: data){ // Data model, data input
                    
                    print(posts)
                    DispatchQueue.main.async {
                        //
                        self.gigs += posts.Results
                    }
                }
            }
        }.resume()
    }
    
    func getSolidWorkPosts() {
        guard let url = URL(string: "\(self.domain)/api/solidworks/\(self.solidworkspageIndex)") else { // Stop the code from running crash
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                if let posts = try? JSONDecoder().decode(Results.self, from: data){ // Data model, data input
                    
                    print(posts)
                    DispatchQueue.main.async {
                        //
                        self.solidWork += posts.Results
                    }
                }
            }
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
