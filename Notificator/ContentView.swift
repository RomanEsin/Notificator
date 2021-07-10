//
//  ContentView.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI

struct ContentView: View {

    @State var hasGroup = false

    var body: some View {
        if hasGroup {
            TabView {
                NotificationsView()
                MyCourse()
            }
            .transition(.move(edge: .bottom).animation(.easeInOut))
        } else {
            CreateCourse(hasGroup: $hasGroup.animation(.easeInOut))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
