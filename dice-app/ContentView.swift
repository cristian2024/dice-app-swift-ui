//
//  ContentView.swift
//  dice-app
//
//  Created by Cristian Daniel Ramirez Marin on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var dice1: Int =  Int.random(in: 1...6)
    @State var dice2: Int =  Int.random(in: 1...6)
    
    @State private var hasTimeElapsed = true
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            HStack {
                Image(String(dice1))
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100
                    )
                    .onTapGesture {
                        if hasTimeElapsed{
                            Task{
                                await onClick()
                            }
                        }
                        
                    }
                Image(String(dice2))
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100
                    )
                    .onTapGesture {
                        if hasTimeElapsed{
                            Task{
                                await onClick()
                            }
                        }
                    }
            }
            .padding()
        }
        
    }
    
    private func onClick() async {
        hasTimeElapsed=false;
        for _ in (1...6){
            try? await Task.sleep(nanoseconds: 0_100_000_000)
            dice1=Int.random(in: 1...6)
            dice2=Int.random(in: 1...6)
        }
        
        hasTimeElapsed = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
