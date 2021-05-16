//
//  RingView.swift
//  Munchin
//
//  Created by Joseph Torres on 5/4/21.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent = 88
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style:
                            StrokeStyle(lineWidth: 5))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5,
                    lineCap: .round,
                    lineJoin: .round,
                    miterLimit: .infinity,
                    dash: [20,0], dashPhase: 0
                    )
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1,y: 0, z: 0)
                    )
                .frame(width: width, height: height)
                .shadow(color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
            
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
