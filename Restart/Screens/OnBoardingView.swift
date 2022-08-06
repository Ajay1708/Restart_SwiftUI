//
//  OnBoardingView.swift
//  Restart
//
//  Created by Venkata Ajay Sai Nellori on 13/03/22.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = true
    /*
     Here we are not setting the property value to true. It's just for safety reasons, in case the program doesn't find the onboarding key in the permanent storage.
     This true value will only be added to the property when the program does not find the onboarding key previously set in the device's permanent storage.
     When the running program finds a previously created onboarding key. then it will ignore the value set (right part after the equal sign) no matter what is there.
     */
    @State var buttonWidth: CGFloat  = UIScreen.main.bounds.width - 80
    @State var buttonOffset: CGFloat = 0
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20){
                //MARK: Header
                
                Spacer()
                VStack(spacing:0){
                    Text("Share.")
                        .font(Font.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                        It's not how much we give but how much love we put into giving.
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
                
                //MARK: Center
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                
                //MARK: Footer
                
                ZStack{
              // PARTS OF THE CUSTOM BUTTON
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION(STATIC)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. CAPSULE(DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                        .frame(width: buttonOffset+80)
                        Spacer()
                    }
                    // 4. CIRCLE(DRAGGABLE)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && gesture.translation.width <= buttonWidth-80{
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{ gesture in
                                    if buttonOffset > buttonWidth/2{
                                        buttonOffset = buttonWidth-80
                                        isOnBoardingViewActive = false  
                                    }
                                    else{
                                        buttonOffset = 0
                                    }
                                }
                        )//: GESTURE
                        /*.onTapGesture {
                            isOnBoardingViewActive = false
                        }*/
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
            }
        }
        .
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
