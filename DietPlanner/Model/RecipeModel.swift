//
//  Recipe.swift
//  DietPlanner
//
//  Created by user193216 on 12/5/21.
//

import Foundation

struct result : Codable {
    public var results : [Recipe]
}
struct Recipe:Codable {
    var id : Int
    var title : String
    var image : String
}
