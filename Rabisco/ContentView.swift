//
//  ContentView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 21/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Sketchbook", systemImage: "book.fill") {
                NavigationStack{
                    SketchbookView()
                        
                }
            }
            Tab("Atividades", systemImage: "magazine.fill") {
                NavigationStack {
                    AtividadesView()
                }
            }
            Tab(role:.search) {
                Text("Pesquisa")
            }
        }
    }
}

#Preview {
    ContentView()
}
