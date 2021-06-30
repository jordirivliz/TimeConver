//
//  ContentView.swift
//  TimeConver
//
//  Created by Jordi Rivera Lizarralde on 30/6/21.
//

import SwiftUI
import Darwin

struct ContentView: View {
    @State private var numberEntered = ""
    @State private var unit1 = 1
    @State private var unit2 = 1
    
    let inputs = ["seconds", "minutes", "hours", "days"]
    let outputs = ["seconds", "minutes", "hours", "days"]
    
    var result: Double {
        let input = Double(numberEntered) ?? 0
        
        var seconds: Double = 0.0
        // Convert user's input into seconds
        switch unit1 {
        case 0:
            seconds = input
        case 1:
            seconds = input * 60
        case 2:
            seconds = input * 60 * 60
        case 3:
            seconds = input * 24 * 60 * 60
        default:
            seconds = 0
        }
        
        // Convert user's input into selected output
        var result: Double = 0.0
        switch unit2 {
        case 0:
            result = seconds
        case 1:
            result = seconds / 60
        case 2:
            result = seconds / (60 * 60)
        case 3:
            result = seconds / (24 * 60 * 60)
        default:
            result = 0
        }
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter the value you want to convert")) {
                    TextField("Value", text: $numberEntered)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Conversion from \(inputs[unit1])")) {
                    Picker("From", selection: $unit1) {
                        ForEach(0..<inputs.count) {
                            Text("\(self.inputs[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Conversion to \(outputs[unit2])")) {
                    Picker("From", selection: $unit2) {
                        ForEach(0..<outputs.count) {
                            Text("\(self.outputs[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("\(numberEntered) \(inputs[unit1]) is equivalent to \(result, specifier: "%.2f") \(outputs[unit2])")){
                    Text("\(result, specifier: "%.2f")")   
                }
            }
            .navigationBarTitle("TimeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
