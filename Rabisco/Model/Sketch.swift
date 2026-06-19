//
//  Sketch.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 21/05/26.
//

import Foundation
import SwiftData

@Model
class Sketch {
    var descricao: String
    @Attribute(.externalStorage) var image: Data?
    
    init(descricao: String, image: Data? = nil) {
        self.descricao = descricao
        self.image = image
    }
}




