//
//  anime.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-03.
//

import Foundation
struct animeList : Codable{
    public var top_aired_fanarts : [animeListItems0]
    public var new_episodes : animeListItems1
    public var most_watched_this_month : [animeListItems2]
    public var top_last_aired : [animeListItems3]
    public var premieres : [animeListItems4]
}
struct animeListItems0 : Codable{
    var title : String
    var rank : Int
    var art : String
    var episode_title : String
    var episode : String
}
struct animeListItems2 : Codable{
    
    var title : String
    var poster : String
    var bottom_text : String
    var anime_type : String
    
}
struct animeListItems3 : Codable{
    
    var title : String
    var poster : String
    var bottom_text : String
    var anime_type : String
}
struct animeListItems4 : Codable{
    
    var title : String
    var poster : String
    var bottom_text : String
    var anime_type : String
}




struct animeListItems1 : Codable
{
    var today : list1
    var yesterday : list1
    var two_days : list1
    
    enum CodingKeys : String, CodingKey
    {
        case  two_days = "2days"
        case today
        case yesterday
    }
   
}
struct list1 : Codable
{
    var timezone : String
    var items : Details1
}
struct Details1 : Codable
{
    var all : [listDetails1]
}
struct listDetails1 : Codable
{
    var title : String
    var rank : Int
    var air_time : String
    var network : String?
    var poster : String
    var season : Int
    var episode : Int
    var watched : Int
}

