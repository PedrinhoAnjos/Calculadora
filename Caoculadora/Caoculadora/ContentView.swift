//
//  ContentView.swift
//  Caoculadora
//
//  Created by João Pedro da Silva dos Anjos on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    
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
            VStack(alignment: .leading, spacing: 20){
                HStack {
                    Text("Qual é a idade do seu cão?")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                VStack (alignment: .leading, spacing: 8) {
                    Text("Anos")
                        .font(.headline)
                    
                    TextField("Digite quantos anos seu cão tem", value: $years, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 348, height: 40)
                        .foregroundColor(.blue)
                    
                    Text("Meses")
                        .font(.headline)
                    TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 348, height: 40)
                        .foregroundColor(.blue)
                }
            }
            .padding(24)
            
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
