//
//  RecordPlayersView.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct RecordPlayersView: View {
    @State private var gameType: GameType? = GameType(rawValue: UserDefaults.standard.string(forKey: "selectedGameType") ?? "")
    
    var body: some View {
        GeometryReader { GR in
            let size = GR.size
            
            VStack {
                HStack {
                    Text("Game1 - Set1")
                        .font(.system(size: 17))
                }
                .frame(width: size.width, height: size.height * 0.2, alignment: .center)
                .offset(y: -15)
                
                ScrollView {
                    VStack(spacing: 20) {
                        if gameType == .single {
                            HStack {
                                NavigationLink {
                                    PlayerMoveView()
                                }
                                label: {
                                    HStack {
                                        Text("Player")
                                            .font(.system(size: 15))
                                    }
                                    .padding()
                                    .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                }
                                
                                NavigationLink {
                                    PlayerMoveView()
                                }
                                label: {
                                    HStack {
                                        Text("Player")
                                            .font(.system(size: 15))
                                    }
                                    .padding()
                                    .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                }
                            }
                        } else if gameType == .double {
                            VStack {
                                HStack {
                                    NavigationLink {
                                        PlayerMoveView()
                                    }
                                    label: {
                                        HStack {
                                            Text("Player")
                                                .font(.system(size: 15))
                                        }
                                        .padding()
                                        .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                    }
                                    
                                    NavigationLink {
                                        PlayerMoveView()
                                    }
                                    label: {
                                        HStack {
                                            Text("Player")
                                                .font(.system(size: 15))
                                        }
                                        .padding()
                                        .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                    }
                                }
                                
                                HStack {
                                    NavigationLink {
                                        PlayerMoveView()
                                    }
                                    label: {
                                        HStack {
                                            Text("Player")
                                                .font(.system(size: 15))
                                        }
                                        .padding()
                                        .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                    }
                                    
                                    NavigationLink {
                                        PlayerMoveView()
                                    }
                                    label: {
                                        HStack {
                                            Text("Player")
                                                .font(.system(size: 15))
                                        }
                                        .padding()
                                        .frame(width: size.width * 0.95, height: 10, alignment: .center)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: size.width, height: size.height * 0.8, alignment: .center)
            }
            .frame(width: size.width, height: size.height, alignment: .center)
        }
    }
}

