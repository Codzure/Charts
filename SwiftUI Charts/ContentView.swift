//
//  ContentView.swift
//  SwiftUI Charts
//
//  Created by Leonard Mutugi on 20/12/2022.
//

import Charts
import SwiftUI

struct ContentView: View {
    
    let weekdays = Calendar.current.shortWeekdaySymbols
    let workouts = [45,65,75,15,22,30,35]
    
    var body: some View {
        VStack {
            Text("Workout")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .padding()
            Chart{
                ForEach(weekdays.indices, id:\.self){
                    idx in
                    BarMark(x: .value("Day", weekdays[idx]), y: .value("workout(mins)", workouts[idx]))
                        .foregroundStyle(by: .value("Day", weekdays[idx]))
                        .annotation{
                            Text("\(workouts[idx]) mins")
                                .font(.caption)
                        }
                }
            }
            .frame(height: 400)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
