//
//  ContentView.swift
//  TimeConverter
//
//  Created by Aqib Ahmed on 01/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    
    var outputVal: Double {
        var inputVal = Double(userInput) ?? 0.0
        // Convert input value to seconds:
        if(inputVal == 0.0 || userInputUnits == 0) {
            
        } else if(userInputUnits == 1) {
            inputVal = inputVal * 60.0
        } else if(userInputUnits == 2) {
            inputVal = inputVal * 3600.0
        } else if(userInputUnits == 3) {
            inputVal = inputVal * 86400.0
        } else {
            inputVal = 0.0
        }
        
        if(userOutputUnits == 0) {
            return inputVal
        } else if(userOutputUnits == 1) {
            return inputVal / 60.0
        } else if(userOutputUnits == 2) {
            return inputVal / 3600.0
        } else if(userOutputUnits == 3) {
            return inputVal / 86400.0
        } else {
            return 0.0
        }
    }
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var userInputUnits = 0
    @State private var userOutputUnits = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("input units")) {
                    Picker ("", selection: $userInputUnits) {
                        ForEach (0 ..< timeUnits.count) {
                            Text("\(timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("output units")) {
                    Picker ("", selection: $userOutputUnits) {
                        ForEach (0 ..< timeUnits.count) {
                            Text("\(timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("initial units: \(timeUnits[userInputUnits])")) {
                    TextField("Input Value", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("converted value")) {
                    if(userInput == "") {
                        Text("-")
                            .frame(maxWidth:.infinity, alignment: .trailing)
                    } else {
                        Text("\(outputVal, specifier:"%g") \(timeUnits[userOutputUnits])")
                            .frame(maxWidth:.infinity, alignment: .trailing)
                    }
                    
                }
            }
            .navigationBarTitle("TimeConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
