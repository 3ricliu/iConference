//
//  Contact.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import Foundation
import SwiftUI

struct Contact: Comparable {
    let id = UUID()
    let name: String
    let image: Image
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
}
