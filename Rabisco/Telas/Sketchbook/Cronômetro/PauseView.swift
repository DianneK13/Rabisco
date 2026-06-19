//
//  PauseView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 26/05/26.
//

import SwiftUI

struct PauseView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack (spacing: 15) {
                Text("Atividade Pausada")
                    .foregroundStyle(.white)
                    .font(.title)
                Text("Retorna em:")
                    .foregroundStyle(.white)
                    .font(.title2)
                
                // timer 5min
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "play.fill")
                        .tint(.black)
                        .frame(maxWidth: 30, maxHeight: 30)
                }.glassEffect()
            }
            
        }
        
    }
}

#Preview {
    PauseView()
}
