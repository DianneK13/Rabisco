//
//  SketchbookView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 21/05/26.
//

import SwiftUI

struct SketchbookView: View {
    var body: some View {
        
        let todaysPick = data.randomElement()
        
        
        ScrollView {
            Text("Alimente seu Sketchbook com lindos desenhos!").foregroundStyle(.black).font(.caption)
            // O LazyVGrid fica aqui
        }
        .background(Image("AlimenteSeuSketchbook"))
        .navigationTitle("Sketchbook")
        .toolbar {
            NavigationLink {
                if let todaysData = todaysPick {
                    DescriptionView(
                        title: todaysData.title,
                        image: todaysData.image,
                        description: todaysData.description
                    )
                }
            } label: {
                Label("Novo Sketch", systemImage: "plus")
                    .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SketchbookView()
    }
}
