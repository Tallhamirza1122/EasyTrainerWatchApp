import SwiftUI

struct RecordView: View {
    @State var list = ["Start Set", "Game Stats", "End Game"]
    @State var name = "Game 1"
    @State var disableField = true
    @State var isGameStart = false
    
    var body: some View {
        GeometryReader { GR in
            let size = GR.size
            
            VStack {
                HStack {
                    Image("paddle_icon")
                        .resizable()
                        .frame(width: 30, height: 40, alignment: .center)
                    if disableField {
                        Text("Game 1")
                            .font(.system(size: 17))
                    } else {
                        TextField("", text: $name)
                            .font(.system(size: 17))
                            .disabled(disableField ? true : false)
                            .textFieldStyle(.automatic)
                            .background(.clear)
                    }
                    
                    Image(systemName: "pencil")
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(Color.red.opacity(0.01))
                        .onTapGesture {
                            disableField.toggle()
                        }
                }
                .frame(width: size.width, height: size.height * 0.2, alignment: .center)
                .offset(y: -15)
                
                ScrollView {
                    VStack {
                        ForEach(list, id: \.self) { item in
                            if item == list[0] {
                                if !isGameStart {
                                    Button(action: {
                                        withAnimation {
                                            isGameStart.toggle()
                                        }
                                    }) {
                                        Text(item)
                                            .padding()
                                            .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                    }
                                }else {
                                    HStack {
                                        NavigationLink(destination: RecordPlayersView()) {
                                            Text("End Set")
                                                .font(.system(size: 15))
                                        }
                                        .frame(width: 95, height: 70, alignment: .center)
                                        
                                        NavigationLink(destination: RecordPlayersView()) {
                                            Text("Add Move")
                                                .font(.system(size: 15))
                                        }
                                        .frame(width: 95, height: 70, alignment: .center)
                                    }
                                }
                            } else {
                                NavigationLink(destination: item == list[1] ? StatisticsView() : nil) {
                                    Text(item)
                                        .padding()
                                        .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                }
                            }
                        }
                    }
                }
                .frame(width: size.width, height: size.height * 0.8, alignment: .center)
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            .navigationBarBackButtonHidden()
        }
    }
}
