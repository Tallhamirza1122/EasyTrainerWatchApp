//
//  AllSetsView.swift
//  PadelStats Watch App
//
//  Created by Hammas Naik on 03/02/2024.
//

import SwiftUI

struct AllSetsView: View
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
                        
                        HStack
                        {
                            VStack
                            {
                                HStack
                                {
                                    Text("Players 1")
                                    
                                    Spacer()
                                }
                                
                                HStack
                                {
                                    Text("Good Moves")
                                    
                                    Spacer()
                                    
                                    Text("10")
                                }
                                
                                HStack
                                {
                                    Text("Players 1")
                                    
                                    Spacer()
                                    
                                    Text("2")
                                }
                            }
                            
                            .padding()
                            .frame(width: size.width * 0.95, alignment: .center)
                            .background(Color(uiColor: UIColor.darkGray).opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                    }
                    }
                }
            }
        }
        .navigationTitle("All Sets")
    }
}

