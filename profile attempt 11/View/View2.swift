//
//  View2.swift
//  profile attempt 11
//
//  Created by Shaden Alghamdi on 04/12/2023.
//

import SwiftUI

struct View2: View {
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                // Page 1 content
                VStack {
                    HStack {
                        Spacer()
                        Button("Skip") {
                            // Handle skip action
                            // For example, navigate to the main content or dismiss the onboarding
                        }
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    }
                    
                    Spacer()
                    
                    // 1st page
                    Image("1")
                        .resizable()
                        .frame(width: 250.0, height: 250.0)
                    
                    Text("Know Your Body Shape")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 15)
                    
                    Text("We will help you know your body \nshape & make it easier for you to choose the right cuts!")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .tag(0)
                
                // Page 2 content
                VStack {
                    HStack {
                        Spacer()
                        Button("Skip") {
                            // Handle skip action
                            // For example, navigate to the main content or dismiss the onboarding
                        }
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    }
                    
                    Spacer()
                    
                    // 2nd page
                    Image("2")
                        .resizable()
                        .frame(width: 250.0, height: 250.0)
                        .shadow(color: Color(hue: 1, saturation: 0.0, brightness: 0.950), radius: 9, x: 0, y: 0)
                    
                    Text("Blane Your Background")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 15)
                    
                    Text("Make sure there are no objects except your body!")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .tag(1)
                
                // Page 3 content
                VStack {
                    HStack {
                        Spacer()
                        Button("Skip") {
                            // Handle skip action
                            // For example, navigate to the main content or dismiss the onboarding
                        }
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    }
                    
                    Spacer()
                    
                    // 3rd page
                    VStack {
                        Image("3")
                            .resizable()
                            .frame(width: 250.0, height: 250)
                        
                        Text("Wear Your Tight Clothes")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 15)
                        
                        Text("Make sure you don’t wear loose clothes!")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: currentPage) { newValue in
                // Update currentPage when it changes
                currentPage = newValue
            }
            
            // Get Started button
            if currentPage == 2 {
                Button(action: {
                    // Handle get started action
                    // For example, navigate to the main content or dismiss the onboarding
                }) {
                    Text("Get Started")
                        .foregroundColor(.akdar)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.black)
                        )
                }
                .padding(.bottom, 0.5)
            }
            
            // Slide points
            HStack(spacing: 8) {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(index == currentPage ? .movee : .gray)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
