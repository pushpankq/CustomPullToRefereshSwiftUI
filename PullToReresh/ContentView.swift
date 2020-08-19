//
//  ContentView.swift
//  PullToReresh
//
//  Created by Pushpank Kumar on 19/08/20.
//  Copyright © 2020 Pushpank Kumar. All rights reserved.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    @State private var isShowing = true
    @State private var isCall = true
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(0..<50) { _ in
                    NavigationLink(destination: Text("HI")) {
                        Text("Hello, World!")
                    }
                }.pullToRefresh(isShowing: $isShowing) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.isShowing = false
                    }
                }
            }
            .onDisappear {
                self.isShowing = false
                self.isCall = true
            }.navigationBarTitle("Hi ", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
