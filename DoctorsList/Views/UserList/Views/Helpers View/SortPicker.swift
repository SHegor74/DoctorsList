//
//  SortPicker.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 13.05.2024.
//

import SwiftUI

struct SortPicker: View {
    
    @State private var selectedSegment = 0
    let segments = ["По цене", "По стажу", "По рейтингу"]
    
    var body: some View {
            Picker(selection: $selectedSegment, label: Text("Choose")) {
                ForEach(0 ..< segments.count) { index in
                    Text(segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onAppear(perform: {
                UISegmentedControl.appearance().selectedSegmentTintColor = .systemPink
            })
    }
        
}
