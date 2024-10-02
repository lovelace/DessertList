//
//  MealView.swift
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

import SwiftUI
import WebKit

struct DetailedMealView: View {
    var mealId: String
    @StateObject var detailedMealModels = DetailedMealsModel()
    @State var meal = DetailedMeal()
    
    var body: some View {
        
        ScrollView {
            VStack {
                // Top part is an image of the dessert (if available) and the name
                if !meal.imageThumbURL.isEmpty {
                    AsyncImage(url: URL(string: meal.imageThumbURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .clipShape(.rect(cornerRadius: 20.0))
                    .frame(width: 300, height: 300)
                }
                Text("\(meal.name)")
                    .font(.title)
                
                Spacer()
                Spacer()
                
                // Next we show the ingredients as a small image of each ingredient, how much, and the ingredient name
                Text("Ingredients")
                    .font(.title3)
                VStack(alignment: .leading) {
                        ForEach(0..<20, id: \.self) { num in
                            let ingredient = meal.ingredients[num]
                            let measure = meal.measures[num]
                            if !ingredient.isEmpty {
                                HStack {
                                    AsyncImage(url: URL(string: "https://www.themealdb.com/images/ingredients/\(ingredient)-small.png")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    .background(
                                        LinearGradient(gradient:
                                                        Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                                                       startPoint:
                                                        UnitPoint(x: 0.5, y: 0),
                                                       endPoint:
                                                        UnitPoint(x: 0.0, y: 0.6)
                                                      )
                                        .opacity(0.5)
                                    )
                                    .clipShape(.rect(cornerRadius: 5.0))
                                    Text("\(measure)")
                                    Text("\(ingredient)")
                                }
                            }
                        }
                }
                
                Spacer()
                Spacer()
                
                // Then we follow up the ingredients with instructions on how to make the dish
                Text("Instructions")
                    .font(.title3)
                Text("\(meal.instructions)")
                    .padding()
                
                Spacer()
                
                // Finally, if there is a link to a video about how to make the dish, show a link to it
                if !meal.youtubeURL.isEmpty {
                    Link("Video", destination: URL(string: meal.youtubeURL)!)
                }
            }
        }
        .task {
            await meal = detailedMealModels.getMealDetails(id: mealId)
        }
        .refreshable {
            await meal = detailedMealModels.getMealDetails(id: mealId)
        }
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

#Preview {
    // Randomly pick Apple & Blackberry Crumble for preview
    DetailedMealView(mealId: "52893")
}
