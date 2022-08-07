//
//  HomeView.swift
//  Restart
//
//  Created by Venkata Ajay Sai Nellori on 13/03/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = true
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing:20){
            // MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? -35 : 35)
                    .animation(
                        .easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }//: HEADER
            
            // MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            // MARK: - FOOTER
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnBoardingViewActive = true

                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
        }//: VSTACK
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
