//
//  Api.swift
//  FakeFiverr
//
//  Created by Vincent He on 2020-10-25.
//

import Foundation

struct Results: Codable{
    var Results : [GigsContent]
}

struct GigsContent: Codable, Identifiable{
    let id = UUID()
    var Search_Tag: String
    var Title:String
    var Seller_Name:String
    var Seler_Picure:String
    var Gig_Picture:String
}
