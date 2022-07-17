//
//  HomeView.swift
//  Restart
//
//  Created by Venkata Ajay Sai Nellori on 13/03/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = true
    var body: some View {
        VStack(spacing:20){
            // MARK: HEADER
            Spacer()
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
            
            // MARK: CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                
            Spacer()
            
            // MARK: FOOTER
            Button {
                isOnBoardingViewActive = false
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
