//
//  MainView.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 10.05.2024.
//

import SwiftUI

struct MainView: View {
    let tabs = ["Врачи"]
    
    let userService = UserService()
    
    @State private var selection: String
    
    init() {
        _selection = State(initialValue: tabs[0])
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            let userViewModel = UserViewModel(userService: userService)
            UserListView(userViewModel: userViewModel)
                .tabItem {
                    Label("Врачи", systemImage: "person")
                }.tag(tabs[0])
        })
        .navigationBarTitle(selection)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
