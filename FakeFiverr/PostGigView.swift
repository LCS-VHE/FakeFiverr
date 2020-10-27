//
//  PostGigView.swift
//  FakeFiverr
//
//  Created by Vincent He on 2020-10-25.
//

import SwiftUI
import SDWebImageSwiftUI


struct PostGigView: View {
    var gig_image:String = "https://576468aa62e1.ngrok.io/get_image/I%20will%20do%20web%20scraping%2C%20data%20extracting%2C%20data%20mining%2C%20data%20scraping%200%20krishu_patel.png"
    var gig_title = "I will do web scraping , data mining , data scraping and data extraction"
    
    var seller_img = "https://2cd60989f482.ngrok.io/get_image/adeeltallat.png"
    
    var body: some View {
        VStack{
            WebImage(url:URL(string: self.gig_image)).resizable()
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack{
                VStack {
                    Spacer()
                    WebImage(url:URL(string: self.seller_img))
                        .resizable()
                        .frame(width:50, height:50)
                        .clipShape(Circle())
                    Spacer()
                }
                
                
                Text(self.gig_title)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width:200, height:200)
    }
}

struct BuyerGigView : View{
    var gig_image:String = ""
    var gig_title = ""
    var seller_img = ""
    
    
    var body:some View{
        NavigationView{
            VStack{
                Text(self.gig_title)
            }
            .navigationBarTitle("")
        }
    }
}

struct PostGigView_Previews: PreviewProvider {
    static var previews: some View {
        PostGigView()
    }
}
