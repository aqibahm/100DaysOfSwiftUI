//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aqib Ahmed on 06/06/21.
//

import SwiftUI

// Custom modifier that makes a view have a large,  blue font suitable for prominent titles in a view:
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
    }
}

// Accompanying view extension for the view modifier
extension View {
    func title() -> some View {
        self.modifier(Title())
    }
}


struct ContentView: View {
    var body: some View {
        Text("This uses a Custom Modifier 😃")
            .title()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
