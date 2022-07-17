//
//  CircleGroupView.swift
//  Restart
//
//  Created by Venkata Ajay Sai Nellori on 17/07/22.
//

import SwiftUI

struct CircleGroupView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(.white.opacity(0.2),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(.white.opacity(0.2),lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}
