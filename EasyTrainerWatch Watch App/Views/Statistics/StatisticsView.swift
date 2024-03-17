//
//  StatisticsView.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct StatisticsView: View
{
    var body: some View
    {
        GeometryReader
        {GR in
            let size = GR.size
            
            ScrollView
            {
                LazyVStack
                {
                    ForEach(0..<10, id: \.self)
                    {(index) in
                        
                        NavigationLink
                        {
                            GameList()
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
        .navigationTitle("Statistics")
    }
}
