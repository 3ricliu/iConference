//
//  Contact.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import Foundation
import SwiftUI

struct Contact: Comparable, Encodable {
    var id = UUID()
    let name: String
    let image: UIImage
    
    enum CodingKeys: CodingKey {
        case id, name, image
    }
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        try container.encode(imageData, forKey: .image)
    }
}
