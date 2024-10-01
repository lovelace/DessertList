//
//  DetailedMeal.swift
//  DessertList
//
// MIT License
//
// Copyright (c) 2024 Tanner Lovelace
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation


struct DetailedMeal: Decodable, Identifiable {
    var id: String
    var name: String
    var imageThumbURL: String
    var instructions: String
    var youtubeURL: String
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    var measure1: String?
    var measure2: String?
    var measure3: String?
    var measure4: String?
    var measure5: String?
    var measure6: String?
    var measure7: String?
    var measure8: String?
    var measure9: String?
    var measure10: String?
    var measure11: String?
    var measure12: String?
    var measure13: String?
    var measure14: String?
    var measure15: String?
    var measure16: String?
    var measure17: String?
    var measure18: String?
    var measure19: String?
    var measure20: String?
    
    // Let's use computed properties to make accessing the ingredients and measures easier
    
    var ingredients: [String] {
        [
            // If a field is null, for now just default to an empty string to avoid problems
            ingredient1 ?? "",
            ingredient2 ?? "",
            ingredient3 ?? "",
            ingredient4 ?? "",
            ingredient5 ?? "",
            ingredient6 ?? "",
            ingredient7 ?? "",
            ingredient8 ?? "",
            ingredient9 ?? "",
            ingredient10 ?? "",
            ingredient11 ?? "",
            ingredient12 ?? "",
            ingredient13 ?? "",
            ingredient14 ?? "",
            ingredient15 ?? "",
            ingredient16 ?? "",
            ingredient17 ?? "",
            ingredient18 ?? "",
            ingredient19 ?? "",
            ingredient20 ?? ""
        ]
    }

    var measures: [String] {
        [
            // If a field is null, for now just default to an empty string to avoid problems
            measure1 ?? "",
            measure2 ?? "",
            measure3 ?? "",
            measure4 ?? "",
            measure5 ?? "",
            measure6 ?? "",
            measure7 ?? "",
            measure8 ?? "",
            measure9 ?? "",
            measure10 ?? "",
            measure11 ?? "",
            measure12 ?? "",
            measure13 ?? "",
            measure14 ?? "",
            measure15 ?? "",
            measure16 ?? "",
            measure17 ?? "",
            measure18 ?? "",
            measure19 ?? "",
            measure20 ?? ""
        ]
    }

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageThumbURL = "strMealThumb"
        case instructions = "strInstructions"
        case youtubeURL = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
    
    init() {
         id = ""
         name = ""
         imageThumbURL = ""
         instructions = ""
         youtubeURL = ""
         ingredient1 = ""
         ingredient2 = ""
         ingredient3 = ""
         ingredient4 = ""
         ingredient5 = ""
         ingredient6 = ""
         ingredient7 = ""
         ingredient8 = ""
         ingredient9 = ""
         ingredient10 = ""
         ingredient11 = ""
         ingredient12 = ""
         ingredient13 = ""
         ingredient14 = ""
         ingredient15 = ""
         ingredient16 = ""
         ingredient17 = ""
         ingredient18 = ""
         ingredient19 = ""
         ingredient20 = ""
         measure1 = ""
         measure2 = ""
         measure3 = ""
         measure4 = ""
         measure5 = ""
         measure6 = ""
         measure7 = ""
         measure8 = ""
         measure9 = ""
         measure10 = ""
         measure11 = ""
         measure12 = ""
         measure13 = ""
         measure14 = ""
         measure15 = ""
         measure16 = ""
         measure17 = ""
         measure18 = ""
         measure19 = ""
         measure20 = ""
    }
}
