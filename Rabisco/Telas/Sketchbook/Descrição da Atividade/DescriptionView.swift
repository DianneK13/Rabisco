//
//  DescriptionView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 22/05/26.
//

import SwiftUI


struct DescriptionView: View {
    
    let title: String
    let image: String
    let description: String
    
    var body: some View {
        
        ScrollView {
            VStack{
                // Imagem
                Image(image)
                    .resizable()
                    .frame(width: 356, height: 187)
                    .cornerRadius(20)
                    
                        
                // Botão para realizar atividade
                HStack{
                    NavigationLink(destination: ChronometerView()) {
                        Text("Realizar Atividade").bold(true)
                    }
                    .buttonStyle(.borderedProminent)
                    .shadow(
                        radius: CGFloat(5),
                        x: CGFloat(0), y: CGFloat(5)
                    )
                    .padding(23)
                    Spacer()
                }
                        
                // Visão geral
                VStack(alignment: .leading, spacing: 10){
                    Text("Visão Geral").bold()
                    
                    Text(description)
                }
                .safeAreaPadding(23)
            }
        }
        .scrollEdgeEffectStyle(.automatic, for: .bottom)
        .navigationTitle(title)
        .toolbarVisibility(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

//#Preview {
//    NavigationStack {
//        DescriptionView()
//    }
//}
