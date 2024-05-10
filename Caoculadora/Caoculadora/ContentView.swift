import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    @State var porteSelecionado: Porte = .pequeno
    
    private var color: Color = .init(red: 0x4F/0xFF, green: 0x46/0xFF, blue: 0xE5/0xFF)
    private var color2: Color = .init(red: 0xC7/0xFF, green: 0xD2/0xFF, blue: 0xFE/0xFF)
    
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                    .foregroundColor(color)
                    .frame(height: 150)
                HStack(spacing: 16) {
                    Image(systemName: "dog.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    Text("Cãoculadora")
                        .font(.header4)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.top, 40)
                        .bold()
                    Spacer()
                }
                .padding(24)
            }
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading, spacing: 8){
                    HStack {
                        Text("Qual é a idade do seu cão?")
                            .foregroundColor(color)
                            .font(.header5)
                    }
                }
                VStack (alignment: .leading, spacing: 8) {
                    Text("Anos")
                        .foregroundColor(color)
                        .font(.body1)
                    ZStack{
                        TextField("Digite quantos anos seu cão tem", value: $years, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .foregroundColor(.gray)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(color2)
                    }
                }
                
                VStack (alignment: .leading, spacing: 8) {
                    Text("Meses")
                        .foregroundColor(color)
                        .font(.body1)
                    ZStack{
                        TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .foregroundColor(.gray)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(color2)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Porte")
                        .foregroundColor(color)
                        .font(.body1)
                    Picker("Porte", selection: $porteSelecionado) {
                        ForEach(Porte.allCases, id: \.self) { porte in
                            Text(porte.rawValue.capitalized)
                                .tag(porte)
                        }
                    }
                    .pickerStyle(.segmented)
                    .colorMultiply(color2)
                    .cornerRadius(8)
                }
            }
            .padding(24)
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                    .foregroundColor(color)
                    .padding()
                Text("\(result)")
                    .font(.display)
                    .foregroundColor(color)
                    .padding(24)
            } else {
                Image(.clarinha)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 198.4, height: 150)
                    .padding(.vertical, 40)
            }
            Button(action: processYears, label: {
                Text("Cãocula!")
                    .font(.body1)
                    .foregroundColor(.white)
            })
            .frame(width: 345, height: 50)
            .background(color)
            .cornerRadius(12)
            .padding(.bottom, 24)
        }
    }
    
    func processYears() {
        guard
            let years,
            let months
        else {
            print("Preenche o campo de entrada!")
            return
        }
        guard years > 0 || months > 0 else {
            print("Escreva uma idade válida!")
            return
        }
        
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
