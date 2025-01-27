//
//  CustomConfirmButtonBorder.swift
//  CustomConfirmButton
//
//  Created by Elio Fernandez on 27/01/2025.
//

import SwiftUI
import Lottie

struct CustomConfirmButtonBorder: View {
    @State private var isPlaying = false
    
    var body: some View {
        Button{
            handleButtonTap()
        } label: {
            HStack(spacing: 8) {
                lottieAnimation
                Text("Confirm")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
            }
            .padding()
            .frame(width: 200, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.primary)
            }
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var lottieAnimation: some View {
        LottieView(animation: .named("party_poppers_light"))
            .playing(isPlaying ? .fromFrame(0, toFrame: 165, loopMode: .playOnce) : .fromFrame(166, toFrame: 166, loopMode: .playOnce))
            .frame(width: 70, height: 70)
    }
    
    private func handleButtonTap() {
        isPlaying.toggle()
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
            isPlaying = false
        }
    }
}

#Preview {
    CustomConfirmButtonBorder()
}
