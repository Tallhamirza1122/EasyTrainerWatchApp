import SwiftUI

struct GameTypeView: View {
    @State private var selectedType: GameType? {
        didSet {
            print("Selected Game Type: \(selectedType?.rawValue ?? "nil")")
            saveSelectedGameType(selectedType)
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let size = geometry.size
                
                VStack {
                    HStack(spacing: 5) {
                        Text("Game Type")
                            .font(.system(size: 17))
                            .padding(.trailing, 10)
                        Image("paddle_icon")
                            .frame(width: 25, height: 25)
                    }
                    .padding(.top, 30)
                    .frame(width: size.width, height: size.height * 0.5, alignment: .center)
                    .offset(y: -10)
                    
                    List(GameType.allCases, id: \.self) { type in
                        NavigationLink(
                            destination: destinationView(for: type),
                            tag: type,
                            selection: $selectedType
                        ) {
                            Text(type.rawValue.capitalized)
                        }
                    }
                    .cornerRadius(10)
                    .frame(width: size.width, height: size.height * 0.7, alignment: .center)
                }
                .frame(width: size.width, height: size.height, alignment: .center)
            }
        }
//        .onAppear {
//            // Load previously selected game type from UserDefaults
//            if let rawValue = UserDefaults.standard.string(forKey: "selectedGameType"),
//               let gameType = GameType(rawValue: rawValue) {
//                selectedType = gameType
//            }
//        }
        .onChange(of: selectedType) { newValue in
            saveSelectedGameType(newValue)
            print(newValue ?? "")
        }
    }
    
    private func saveSelectedGameType(_ gameType: GameType?) {
        if let gameType = gameType {
            UserDefaults.standard.set(gameType.rawValue, forKey: "selectedGameType")
        } else {
            UserDefaults.standard.removeObject(forKey: "selectedGameType")
        }
    }
    
    private func destinationView(for type: GameType) -> some View {
        switch type {
        case .single, .double:
            return AnyView(RecordView())
        }
    }
}

struct GameTypeView_Previews: PreviewProvider {
    static var previews: some View {
        GameTypeView()
    }
}
