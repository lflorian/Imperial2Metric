//
//  ContentView.swift
//  Imperial2Metric
//
//  Created by Florian Lammert on 19.10.24.
//

import SwiftUI
    
struct ContentView: View {
    let imperialUnits = ["Inches", "Feet", "Yards", "Miles"]
    let metricUnits = ["Centimeters", "Meters", "Kilometers"]
    
    @State private var fromUnit = "Inches"
    @State private var toUnit = "Centimeters"
    @State private var input : Double = 0
    
    var output : Double {
        let inputInInches : Double
        
        switch fromUnit {
        case "Inches":
            inputInInches = input
        case "Feet":
            inputInInches = input * 12
        case "Yards":
            inputInInches = input * 36
        case "Miles":
            inputInInches = input * 63360
        default:
            inputInInches = 0
        }
        
        switch toUnit {
        case "Centimeters":
            return inputInInches * 2.54
        case "Meters":
            return inputInInches * 0.0254
        case "Kilometers":
            return inputInInches * 0.000254
        default:
            return 0
        }
    }
    

    
    var body: some View {
        NavigationStack {
            Form {
                Section ("From") {
                    TextField("Enter a number", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Select a unit", selection: $fromUnit) {
                        ForEach(imperialUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section ("To") {
                    Text(output, format: .number)
                    
                    Picker("Select a unit", selection: $toUnit) {
                        ForEach(metricUnits, id: \.self) {
                            unit in Text(unit)
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
