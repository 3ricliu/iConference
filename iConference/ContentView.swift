//
//  ContentView.swift
//  iConference
//
//  Created by Eric Liu on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCreateScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 5) {
                    Text("hello \($0)")
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
            CreateView()
        }
    }
    
    func saveData() {
        print("trying to save")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
