//
//  CreateView.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import SwiftUI

struct CreateView: View {
    var contacts: Contacts
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $name)
                    }
                    ZStack {
                        Rectangle()
                            .fill(Color.secondary)
                        
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else {
                            Text("Tap to select image")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
                    Section {
                        Button("Save") {
                            let newContact = Contact(name: name, image: image!)
                            
                            contacts.items.append(newContact)
                            print("new length of contacts \(contacts.items.count)")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(inputImage: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        let contact = Contact(name: "eric", image: Image(systemName: "plus"))
//        var contacts = Contacts()
//        contacts.items.append(contact)
//        CreateView(contacts: contacts)
//    }
//}
