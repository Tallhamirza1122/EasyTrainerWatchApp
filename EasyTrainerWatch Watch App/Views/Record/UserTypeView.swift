import SwiftUI

struct UserTypeView: View {
    @State var userType = ["Player", "Trainer"]
    @Binding var user: User?

    var body: some View {
        NavigationStack {
            GeometryReader { GR in
                let size = GR.size
                
                VStack {
                    HStack(spacing: 5) {
                        Text("User Type")
                            .font(.system(size: 17))
                            .padding(.trailing, 10)
                        
                        Image("paddle_icon")
                            .frame(width: 25, height: 25)
                    }
                    .padding(.top, 30)
                    .frame(width: (size.width), height: size.height * 0.5, alignment: .center)
                    .offset(y: -10)
                    
                    ScrollView {
                        VStack {
                            ForEach(userType, id: \.self) { item in
                                NavigationLink(destination:
                                    item == userType[1] ?
                                               AnyView(GameTypeView()) :
                                        AnyView(RecordView())
                                )
                                {
                                    HStack {
                                        Text(item)
                                    }
                                    .padding()
                                    .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                }
                                .cornerRadius(10)
                            }
                        }
                    }
                    .frame(width: size.width, height: size.height * 0.7, alignment: .center)
                }
                .frame(width: size.width, height: size.height, alignment: .center)
            }
        }
    }
}
