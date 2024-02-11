//
//  Itunes.swift
//  musicsearch
//
//  Created by Tenizbayev Bolat on 02.02.2024.
//

import Foundation
import SwiftyJSON

struct Itunes {
    var user = ""
    var text = ""
    
    init() {
    }
    
    init(json: JSON){
        if let item = json["user"].string{
            user = item
        }
        if let item = json["text"].string{
            text = item
        }
    }
}

//struct Itunes{
//var singer = ""
//var artworkUrl100 = ""
//var track = ""
//var previewUrl = ""
//
//init(){
//    
//}
//
//init(json: JSON){
//    if let item = json["artistName"].string{
//        singer = item
//    }
//    if let item = json["artworkUrl100"].string{
//        artworkUrl100 = item
//    }
//    if let item = json["trackName"].string{
//        track = item
//    }
//    if let item = json["previewUrl"].string{
//        previewUrl = item
//    }
//}
//}


