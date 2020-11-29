//
//  Contacts.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import Foundation

class Contacts: ObservableObject, Encodable {
    @Published var items = [Contact]()

    enum CodingKeys: CodingKey {
        case items
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
    }
}
