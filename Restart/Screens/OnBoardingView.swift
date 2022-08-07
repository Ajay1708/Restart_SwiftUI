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
    @State private var buttonWidth: CGFloat  = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1
    @State private var textTitle : String = "Share."
    
    var hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20){
                //MARK: - HEADER
                
                Spacer()
                VStack(spacing:0){
                    Text(textTitle)
                        .font(Font.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        // Explicitly telling SwiftUI that this is a different view after the value change.
                        // We use ID method to tell SwiftUI that a view is no longer the same view. by doing that we can trigger desired opacity transition to make this happen.
                        .id(textTitle)
                        .transition(.opacity)
                    Text("""
                        It's not how much we give but how much love we put into giving.
                        """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }//: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1, y: 0) // -1 represent opposite value
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0) // 1.2 accelerates the movement
                        .rotationEffect(Angle(degrees: Double(imageOffset.width/20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if abs(gesture.translation.width) <= 150{ //When user drags the graphic to the left direction, then this widht value goes to the negative number range.
                                        hapticFeedback.notificationOccurred(.success)
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Move on."
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    hapticFeedback.notificationOccurred(.warning)
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }//: CENTER
                .overlay(alignment: Alignment.bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                }
                Spacer()
                
                //MARK: - FOOTER
                
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
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth/2{
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth-80
                                            isOnBoardingViewActive = false
                                        }
                                        else{
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )//: GESTURE
                        /*.onTapGesture {
                         isOnBoardingViewActive = false
                         }*/
                        Spacer()
                    }
                }//: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }//: ZStack
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
