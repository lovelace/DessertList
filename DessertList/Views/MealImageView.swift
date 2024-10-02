//
//  MealImageView.swift
//  Desserts
//
//  Created by Tanner Lovelace on 10/1/24.
//

import SwiftUI

struct MealImageView: View {
    @State var name: String
    @State var imageURL: String
    
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = min(geometry.size.width, geometry.size.height)
            let height = width
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                    .scaledToFill()
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(.rect(cornerRadius: 20.0))
                .padding([.bottom])
                .frame(width: width*0.8, height: height*0.8)
            }
            .padding(20.0)
            .frame(width: width)
        }
        .scaledToFill()
        .background(
            LinearGradient(gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                           startPoint: UnitPoint(x: 0.5, y: 0),
                           endPoint: UnitPoint(x: 0.0, y: 0.6)
                           )
                .opacity(0.5)
        )
        .clipShape(.rect(cornerRadius: 20.0))
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

#Preview {
    MealImageView(name: "Apple & Blackberry Crumble", imageURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
}
