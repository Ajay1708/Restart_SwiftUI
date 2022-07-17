//
//  ContentView.swift
//  Restart
//
//  Created by Venkata Ajay Sai Nellori on 13/03/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: 1
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = true
    var body: some View {
        //MARK: 2
        ZStack{
            if isOnBoardingViewActive == true{
                OnBoardingView()
            }
            else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
