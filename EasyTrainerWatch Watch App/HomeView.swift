import SwiftUI

struct HomeView: View {
    @State var list = ["Record Score", "View Statistics", "Information"]
    @State private var user: User?
    
    init() {
        // Check if user exists in UserDefaults
        if let userData = UserDefaults.standard.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: userData) {
            self._user = State(initialValue: savedUser)
            
            // If the user doesn't have a current game, create a new game
            if self.user?.currentGame == nil {
                self.user?.currentGame = Game()
                saveUser(self.user!) // Save the updated user with the new game
            }
        } else {
            // If user doesn't exist, create a default user with a new game
            let defaultUser = User(username: "JohnDoe", currentGame: Game(), stats: nil)
            saveUser(defaultUser)
            self._user = State(initialValue: defaultUser)
        }
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { GR in
                let size = GR.size
                
                VStack {
                    HStack {
                        Text("Padel Stats")
                            .font(.system(size: 17))
                        Image("paddle_icon")
                            .frame(width: 25, height: 25)
                        Spacer()
                    }
                    .frame(width: (size.width), height: size.height * 0.2, alignment: .center)
                    .offset(y: -10)
                    
                    ScrollView {
                        VStack {
                            ForEach(list, id: \.self) { item in
                                NavigationLink(destination: destinationView(for: item)) {
                                    HStack {
                                        Text(item)
                                    }
                                    .padding()
                                    .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                }
                            }
                        }
                    }
                    .frame(width: size.width, height: size.height * 0.8, alignment: .center)
                }
                .frame(width: size.width, height: size.height, alignment: .center)
            }
        }
        .onAppear {
            print("Current User: \(user?.username ?? "No User")")
        }
    }
    
    private func destinationView(for item: String) -> some View {
        if item == list[1] {
            return AnyView(StatisticsView())
        } else if item == list[0] {
            return AnyView(UserTypeView(user: $user))
        } else {
            return AnyView(UserTypeView(user: $user))
        }
    }

    private func saveUser(_ user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: "user")
        }
    }
}
