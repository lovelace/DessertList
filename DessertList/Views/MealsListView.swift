//
//  MealsListView.swift
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

struct MealsListView: View {
    @StateObject var mealsModel = MealsModel()

    var body: some View {
        NavigationView {
            List(mealsModel.meals.sorted { (
                lhs: Meal, rhs: Meal) -> Bool in return lhs.name < rhs.name
            }) { meal in
                NavigationLink(destination: DetailedMealView(mealId: meal.id)) {
                    HStack {
                        // I would prefer to use the preview version of the thumb which
                        // you're supposed to be able to get by adding "/preview" onto
                        // the url, but it looks like not all of them work, so we'll
                        // just use the main url and size it down (which we would have done anyway)
                        AsyncImage(url: URL(string: meal.imageThumbURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(meal.name)
                    }
                }
            }
            .task {
                await self.mealsModel.reload()
            }
            .refreshable {
                await self.mealsModel.reload()
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    MealsListView()
}
