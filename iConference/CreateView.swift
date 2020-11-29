//
//  CreateView.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import SwiftUI

struct CreateView: View {
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

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
