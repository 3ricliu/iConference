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
    
    var disabledForm: Bool {
        inputImage == nil
    }

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
                        
                        if let image = inputImage {
                            Image(uiImage: image)
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
                            let newContact = Contact(name: name, image: inputImage!)
                            
                            contacts.items.append(newContact)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .disabled(disabledForm)
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(inputImage: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.inputImage = inputImage
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
