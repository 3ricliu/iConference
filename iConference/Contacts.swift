//
//  Contacts.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import Foundation

class Contacts: ObservableObject {
    @Published var items = [Contact]()
}
