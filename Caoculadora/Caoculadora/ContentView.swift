import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    @State var porteSelecionado: Porte = .pequeno
    
    private var color: Color = .init(red: 0x4F/0xFF, green: 0x46/0xFF, blue: 0xE5/0xFF)
    private var color2: Color = .init(red: 0xC7/0xFF, green: 0xD2/0xFF, blue: 0xFE/0xFF)
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(alignment: .leading, spacing: 20.0){
                    VStack(alignment: .leading, spacing: 8.0){
                        HStack {
                            Text("Qual é a idade do seu cão?")
                                .foregroundColor(color)
                                .font(.header5)
                                .padding(.top, 24)
                        }
                    }
                    VStack (alignment: .leading, spacing: 8.0) {
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
                    
                    VStack (alignment: .leading, spacing: 8.0) {
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
                    
                    VStack(alignment: .leading, spacing: 8.0){
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
                        .frame(maxWidth: .infinity)
                    Text("\(result)")
                        .font(.display)
                        .foregroundColor(color)
                        .frame(maxWidth: .infinity)
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
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .bold()
            .fontDesign(.rounded)
            .padding()
            .navigationTitle("Cãoculadora")
            .toolbarBackground(
            .visible, for:
            .navigationBar)
            .toolbarBackground(color, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
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
