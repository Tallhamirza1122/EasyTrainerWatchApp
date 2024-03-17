//
//  SetsView.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct SetsView: View
{
    var body: some View
    {
        GeometryReader
        {GR in
            let size = GR.size
            
            ScrollView
            {
                LazyVStack(spacing: 10)
                {
                    ForEach(0..<10, id: \.self)
                    {(index) in
                        
                        NavigationLink
                        {
                            SetInfoView()
                        }
                        label:
                        {
                            HStack
                            {
                                VStack
                                {
                                    HStack
                                    {
                                        Text("Set 1")
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .frame(width: size.width * 0.95, height: 10, alignment: .center)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Set")
    }
}
