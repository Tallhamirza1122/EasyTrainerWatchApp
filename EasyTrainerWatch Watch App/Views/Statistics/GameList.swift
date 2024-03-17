//
//  GameList.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct GameList: View
{
    @State var list = ["All Sets", "Select Set", "Last Set"]
    
    var body: some View
    {
        GeometryReader
        {GR in
            let size = GR.size
            
            ScrollView
            {
                LazyVStack
                {
                    ForEach(list, id: \.self)
                    {(index) in
                        
                        NavigationLink
                        {
                            if index == list[0]
                            {
                                AllSetsView()
                            }
                            else if index == list[1]
                            {
                                SetsView()
                            }
                        }
                        label:
                        {
                            HStack
                            {
                                Text("\(index)")
                                
                                Spacer()
                            }
                            .padding()
                            .frame(width: size.width * 0.95, height: 10, alignment: .center)
                        }
                    }
                }
            }
        }
        .navigationTitle("Game")
    }
}
