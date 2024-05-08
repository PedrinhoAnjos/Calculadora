import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    
    
    private var color: Color = .init(red: 0x4F/0xFF, green: 0x46/0xFF, blue: 0xE5/0xFF)
 
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
                HStack {
                    Text("Qual é a idade do seu cão?")
                        .foregroundColor(color)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                VStack (alignment: .leading, spacing: 8) {
                    Text("Anos")
                        .foregroundColor(color)
                        .font(.headline)
                    
                    TextField("Digite quantos anos seu cão tem", value: $years, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 345, height: 75)
                        .foregroundColor(.blue)
                    
                    Text("Meses")
                        .foregroundColor(color)
                        .font(.headline)
                    TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 345, height: 75)
                        .foregroundColor(.blue)
                    Text("Porte")
                        .foregroundColor(color)
                        .font(.headline)
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 345, height: 28)
                        .cornerRadius(9)
                }
            }
            .padding(24)
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .foregroundColor(color)
                    .font(.headline)
                Text("\(result)")
                    .foregroundColor(color)
                    .font(.headline)
            } else {
                Image(.clarinha)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 198.4, height: 150)
                    .padding(.vertical, 30)
                
            }
//            Button(action: {
//                result = 23
//            }, label: {
//                Text("Porte (de Doguinho)")
//                    .foregroundColor(color)
//                    .font(.headline)
//            })
            Button("Cãocular"){
                result = 23
            }
            .frame(width: 345, height: 50)
            .background(color)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(12)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
