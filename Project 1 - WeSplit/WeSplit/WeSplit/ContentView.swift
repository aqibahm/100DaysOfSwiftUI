//
//  ContentView.swift
//  WeSplit
//
//  Created by Aqib Ahmed on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    // Computed property to display individual payment amount
    var finalAmount: Double {
        let checkAmount = Double(checkAmount) ?? 0
        var peopleCount = Double(numberOfPeople) ?? 0
        peopleCount += 2
        let tipPer = Double(self.tipPercentages[tipPercentage])
        
        let tipAmount = checkAmount * tipPer / 100
        let total = (checkAmount + tipAmount) / peopleCount
    
        return total
    }
    
    var totalWithTip: Double {
        let checkAmount = Double(checkAmount) ?? 0
        let tipPer = Double(self.tipPercentages[tipPercentage])
        
        let total = checkAmount + (tipPer * checkAmount / 100)
        return total
    }
    
    var totalColor: Bool {
        if(tipPercentage == 4) {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
            
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            
                Section(header: Text("Amount per person")) {
                    Text("$\(finalAmount, specifier: "%g")")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(totalColor ? Color.black : Color.red)
                }
                
                Section(header: Text("Total amount for order")) {
                    Text("$\(totalWithTip, specifier: "%g")")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(totalColor ? Color.black : Color.red)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
