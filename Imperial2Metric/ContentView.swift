//
//  ContentView.swift
//  Imperial2Metric
//
//  Created by Florian Lammert on 19.10.24.
//

import SwiftUI
    
struct ContentView: View {
    @State private var fromUnit :
    @State private var toUnit :
    @State private var input : Double = 0

    var output : Double {
        let conversionInt : Double = input * 2.54
        let output = conversionInt / 100
        return output
    }
    

    
    var body: some View {
        NavigationStack {
            Form {
                Section ("From") {
                    TextField("Enter a number", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Select a unit", selection: $fromUnit) {
                        ForEach
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("To") {
                    Text(output, format: .number)
                    
                    Picker("Select a unit", selection: $toUnit) {
                        ForEach
                        }
                    }
                    .pickerStyle(.segmented)
                }
                    
                .navigationTitle("Imperial2Metric")
            }
        }
    }
}

#Preview {
    ContentView()
}
