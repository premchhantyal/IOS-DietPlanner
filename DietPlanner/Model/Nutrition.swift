//
//  Nutrition.swift
//  DietPlanner
//
//  Created by user193216 on 12/12/21.
//

import Foundation

struct nutritionResult:Codable {
    public var bad : [Nutrition]
    public var good : [Nutrition]
}

struct Nutrition:Codable {
    var title : String
    var amount : String
}

