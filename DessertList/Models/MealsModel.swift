//
//  MealModel.swift
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

// Helper struct to extract the data out of the json
struct Meals: Decodable {
    var meals: [Meal]
}

class MealsModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    @MainActor func reload() async {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let mealsData = try JSONDecoder().decode(Meals.self, from: data)
            // Completely replace array with new data
            meals = mealsData.meals
        } catch {
            debugPrint("Error loading data from \(url): \(String(describing: error))")
        }
    }
    
}
