//
//  View1.swift
//  profile attempt 11
//
//  Created by Shaden Alghamdi on 04/12/2023.
//

import SwiftUI

struct View1: View {

    
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
        } else {
            
                

                    VStack {
                        Image( "clo")
                            .scaleEffect(size)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.2)) {
                                    self.size = 0.9
                                    self.opacity = 4.00
                                }
                            }
                        Image("slogen")
                            .padding(.top, -500)
                        
                        
                    }
        
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
                        
                        
                    }
                }
            }
        }
    }

struct View1_previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
