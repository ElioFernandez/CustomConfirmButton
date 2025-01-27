//
//  CustomButton.swift
//  CustomConfirmButton
//
//  Created by Elio Fernandez on 08/01/2025.
//

import SwiftUI
import Lottie

struct CustomConfirmButton: View{
    @State private var isPlaying = false
    
    var body: some View {
        Button{
            handleButtonTap()
        } label: {
            HStack(spacing: 16) {
                lottieAnimation
                Text("Confirm")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .padding()
            .frame(width: 200, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customDarkBlue)
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var lottieAnimation: some View {
        LottieView(animation: .named("party_popper"))
            .playing(isPlaying ? .fromFrame(0, toFrame: 112, loopMode: .playOnce) : .fromFrame(113, toFrame: 113, loopMode: .playOnce))
            .frame(width: 60, height: 60)
    }
    
    private func handleButtonTap() {
        isPlaying.toggle()
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
            isPlaying = false
        }
    }
}

#Preview {
    CustomConfirmButton()
}

