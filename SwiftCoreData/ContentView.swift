//
//  ContentView.swift
//  SwiftCoreData
//
//  Created by Charles Michael on 4/2/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(managedObjectContext)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
