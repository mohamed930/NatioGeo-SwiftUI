//
//  ContentView.swift
//  NatioGeo
//
//  Created by Mohamed Ali on 18/05/2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var size: CGFloat = 1
    @State var imageOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Image("cover1")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
                .shadow(color: .black.opacity(0.35), radius: 8, x: 3, y: 3)
                .scaleEffect(size)
                .offset(x: imageOffset.width,y: imageOffset.height)
            
                .onTapGesture(count: 2) {
                    
                    withAnimation(.spring()) {
                        if size == 1 {
                            size = 5
                        }
                        else {
                            size = 1
                            imageOffset = .zero
                        }
                    }
                }
            
                .gesture(DragGesture()
                    .onChanged({ translation in
                        if size == 5 {
                            imageOffset = translation.translation
                        }
                    })
                         
                    .onEnded({ guester in
                        if size == 5 {
                            imageOffset = guester.translation
                        }
                        else {
                            imageOffset = .zero
                        }
                        
                    })
                )
            
            
                .gesture(MagnificationGesture()
                    .onChanged({ value in
                        
                        withAnimation(.spring()) {
                            
                            if size >= 1 && size <= 5 {
                                size = value
                            }
                        }
                    })
                         
                        .onEnded({ _ in
                            
                            withAnimation(.spring()) {
                                if size < 1 {
                                    size = 1
                                }
                                else if size > 5 {
                                    size = 5
                                }
                            }
                            
                            
                        })
                )
        }
    }
}

struct HomeScreenVieww_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
