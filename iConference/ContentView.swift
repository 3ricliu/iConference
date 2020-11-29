//
//  ContentView.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCreateScreen = false
    @ObservedObject var contacts = Contacts()

    var body: some View {
        NavigationView {
            List {
                ForEach(self.contacts.items.sorted(), id: \.id) { item in
                    NavigationLink(destination: ContactView(contact: item)) {
                        Text("\(item.name)")
                        if let uiImage = item.image {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Text("No Image Selected")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("iConference")
            .navigationBarItems(trailing: Button(action: {
                self.showingCreateScreen = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingCreateScreen, onDismiss: saveData) {
            CreateView(contacts: contacts)
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        print("loading data")
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedContacts")
            let data = try JSONEncoder().encode(self.contacts)
            print(data)
            try data.write(to: filename, options: [.atomicWrite])
        } catch {
            print("Unable to save data")
        }
//        print("saving")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
