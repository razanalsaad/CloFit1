//
//  View3.swift
//  profile attempt 11
//
//  Created by Shaden Alghamdi on 04/12/2023.
//


//import SwiftUI
//
//struct View3: View {
//    @State private var isAnimating = false
//    
//    var body: some View {
//        Image("Pv")
//            .scaleEffect(isAnimating ? 0.5 : 0.8) // Adjust the scale factor as desired
//            .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    // Wait for 2 seconds (adjust as needed)
//                    isAnimating = true
//                    navigateToNextPage() // Call the method to navigate to the next page
//                }
//            }
//    }
//    
//    private func navigateToNextPage() {
//        // Perform navigation to the next page
//        // For example, push a new view or change the presented view
//    }
//}
//
//struct View3_Previews: PreviewProvider {
//    static var previews: some View {
//        View3()
//    }
//    }
