//
//  CellView.swift
//  TestSwiftUICell
//
//  Created by Miguel Orjuela on 30/05/24.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        ZStack {
            ContentView(endValue: 20)
        }
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .background(Color.teal)
        .padding()
    }
}

#Preview {
    CellView()
}

struct ContentView: View {
    @State var value: Int = 0
    var endValue: Int

    var body: some View {
        VStack {
            ZStack {
                Text("\(value)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .monospacedDigit()
                    .foregroundColor(Color.white)
                    .frame(width: 60, height: 40)
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                    .id("Seconds \(value)")
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .onAppear {
                self.runCounter()
            }
        }
    }

    func runCounter(speed: Double = 0.2) {
        value = 0

        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            withAnimation (.easeInOut(duration: 0.5)) {
                self.value += 1
            }
            if value == endValue {
                timer.invalidate()
            }
        }
    }
}
