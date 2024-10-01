//
//  DetailedMealsModel.swift
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
struct DetailedMeals: Decodable {
    var meals: [DetailedMeal]
}

@MainActor 
class DetailedMealsModel: ObservableObject {
    @Published var detailedMeals: [DetailedMeal] = []

    func load(id: String) async throws -> DetailedMeal {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!

        let (data, _) = try await URLSession.shared.data(from: url)
        let detailedMeal = try JSONDecoder().decode(DetailedMeals.self, from: data)
        // There should only ever be one meal here
        detailedMeals.append(detailedMeal.meals[0])
        return detailedMeal.meals[0]
    }

    func findMealById(id: String) -> DetailedMeal? {
        if let i = detailedMeals.firstIndex(where: { $0.id == id }) {
            return detailedMeals[i]
        }
        return nil
    }
    
    func getMealDetails(id: String) async -> DetailedMeal {
        if let meal = findMealById(id: id) {
            return meal
        } else {
            // Not found in array. Try to load from url
            do {
                let meal = try await load(id: id)
                // Loading would have added it to the array, so return the value here
                return meal
            } catch {
                debugPrint("Error loading data for meal id: \(id): \(String(describing: error))")
            }
        }
        // Not found and not able to be loaded. We should ideally return or throw some sort of error here, but for now, just return a blank detailed meal
        return DetailedMeal()
    }

}
