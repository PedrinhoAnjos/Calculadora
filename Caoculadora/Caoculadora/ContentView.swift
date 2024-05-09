import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"
    
    private var color: Color = .init(red: 0x4F/0xFF, green: 0x46/0xFF, blue: 0xE5/0xFF)
    private var color2: Color = .init(red: 0xC7/0xFF, green: 0xD2/0xFF, blue: 0xFE/0xFF)
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                    .foregroundColor(color)
                    .frame(height: 120)
                HStack(spacing: 16) {
                    Image(systemName: "dog.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    Text("Cãoculadora")
                        .font(.title)
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
                            .font(.title2)
                            .bold()
                    }
                }
                VStack (alignment: .leading, spacing: 8) {
                    Text("Anos")
                        .foregroundColor(color)
                        .font(.headline)
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
                        .font(.headline)
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
                        .font(.headline)
                    Picker("Porte", selection: $porte) {
                        ForEach(portes, id: \.self) { porte in
                            Text(porte)
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
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(color)
                    .padding()
                Text("\(result)")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(color)
                    .padding(.vertical, 65)
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
                    .font(.title3)
                    .fontWeight(.semibold)
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
        result = (years + months/12) * 7
    }
}

#Preview {
    ContentView()
}
