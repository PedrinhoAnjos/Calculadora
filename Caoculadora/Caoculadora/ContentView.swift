//
//  ContentView.swift
//  Caoculadora
//
//  Created by João Pedro da Silva dos Anjos on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                    .foregroundColor(.blue)
                    .frame(height: 100)
                HStack {
                    Image(systemName: "dog.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .padding(.top, 18)
                    Text("Cãoculadora")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .bold()
                        .padding(.top, 18)
                    Spacer()
                }
                .padding(24)
            }
            Text("AuAuAuAu!")
                .font(.largeTitle)
                .bold()
            HStack(spacing: 10){
                Image(systemName: "dog.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top, 18)
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                Image(systemName: "dog.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top, 18)
                    .scaleEffect(x: -1, y:1)
            }
            Text("Thriller Bark bark!")
            Spacer()
            Rectangle()
                .ignoresSafeArea(.all)
                .foregroundColor(.white)
                .frame(height: 50)
        }
    }
}

#Preview {
    ContentView()
}
