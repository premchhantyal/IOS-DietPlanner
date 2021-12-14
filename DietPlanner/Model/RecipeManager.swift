//
//  RecipeManager.swift
//  DietPlanner
//
//  Created by user193216 on 12/11/21.
//

import Foundation

class RecipeManager {
    var cuisines = [ Cuisine(n: "American", p: "american"),
                     Cuisine(n: "Chinese", p: "chinese-cuisine"),
                     Cuisine(n: "French", p: "french"),
                     Cuisine(n: "Italian", p: "italian"),
                     Cuisine(n: "Indian", p: "Indian"),
                     Cuisine(n: "Japanese", p: "japanese"),
                     Cuisine(n: "Mexican", p: "mexican"),
                     Cuisine(n: "Thai", p: "thai")
    ]
    
    public func getCuisines() -> [Cuisine] {
        return cuisines
    }
}
