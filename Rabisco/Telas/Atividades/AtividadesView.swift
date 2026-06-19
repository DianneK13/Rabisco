//
//  AtividadesView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 21/05/26.
//

import SwiftUI

struct AtividadesView: View {
    var body: some View {
        
        ListaDeAtividades()
            .navigationTitle("Atividades")
            .toolbar {
                NavigationLink {
                    ChronometerView()
                } label: {
                    Label("Novo Sketch", systemImage: "plus")
                        .foregroundStyle(.accent)
                }
            }
    }
}

struct ListaDeAtividades: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    let emojis: [String] = [
        "😀"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis.enumerated(), id: \.offset) {  index, emoji in
                        NavigationLink {
                            DescriptionView(
                                title: data[index].title,
                                image: data[index].image,
                                description: data[index].description
                            )
                        } label: {
                            ZStack{
                                VStack (spacing: 0) {
                                    
                                    Image("\(data[index].image)")
                                        .resizable()
                                        .frame(maxWidth: 347, maxHeight: 174, alignment: .leading)
                                        .clipShape(.rect(cornerRadius: 8))
                                        .padding(7)
                                    
                                    Text("\(data[index].title)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundStyle(.black)
                                        .font(.title3).bold()
                                        .padding(10)
                                }
                                .frame(maxWidth: .infinity)
                                .background {
                                    Color.gray.opacity(0.3)
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .shadow(radius: 3)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    AtividadesView()
}


