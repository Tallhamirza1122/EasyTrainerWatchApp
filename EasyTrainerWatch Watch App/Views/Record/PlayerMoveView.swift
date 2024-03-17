//
//  PlayerMoveView.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct PlayerMoveView: View
{
    var body: some View
    {
        GeometryReader
        {GR in
            let size = GR.size
            
            VStack
            {
                HStack
                {
                    Text("Add Player Move")
                        .font(.system(size: 17))
                }
                .frame(width: size.width, height: size.height * 0.2, alignment: .center)
                .offset(y: -15)
                
                ScrollView
                {
                    VStack(spacing: 20)
                    {
                        HStack(spacing: 20)
                        {
                            Button
                            {
                                
                            }
                            label:
                            {
                                HStack
                                {
                                    Text("Good")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.green)
                                }
                                .padding()
                            }
                            .frame(width: 80, height: 60, alignment: .center)
                            
                            Image(systemName: "checkmark")
                                .foregroundStyle(.green)
                        }
                        
                        HStack(spacing: 20)
                        {
                            Button
                            {
                                
                            }
                            label:
                            {
                                HStack
                                {
                                    Text("Bad")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.red)
                                }
                                .padding()
                            }
                            .frame(width: 80, height: 50, alignment: .center)
                            
                            Image(systemName: "xmark")
                                .foregroundStyle(.red)
                        }
                    }
                }
                .frame(width: size.width, height: size.height * 0.8, alignment: .center)
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            
        }
    }
}


