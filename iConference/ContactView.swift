//
//  ContactView.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import SwiftUI

struct ContactView: View {
    var contact: Contact

    var body: some View {
        VStack {
            contact.image
                .resizable()
                .scaledToFit()
        }
        .navigationTitle(contact.name)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(name: "Eric", image: Image(systemName: "plus"))
        ContactView(contact: contact)
    }
}
