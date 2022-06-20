//
//  MainView.swift
//  Tetris
//
//  Created by mac on 19.06.2022.
//

import SwiftUI

struct MainView: View {
    @State private var showContentView = false
    @EnvironmentObject var game: TetrisViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
            VStack() {
                Spacer()
                Text("TETRIS GAME")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.purple)
                Spacer()
                Spacer()
                Text("Pick color theme:")
                    .font(.title.weight(.semibold))
                    .foregroundColor(.gray)
                Button(action: {
                    showContentView = true
                    game.co = Color.gray
                    game.col = Color.yellow
                    game.color = Color.yellow
                    game.colo = Color.gray
                    game.c = Color.gray
                }, label: {
                    Text("Original")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                    
                })
                
                Button(action: {
                    showContentView = true
                    game.co = Color.white
                    game.col = Color.black
                    game.colo = Color.black
                    game.color = Color.white
                    game.c = Color.white
                }, label: {
                    Text("Black and white")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                })
                Button(action: {
                    showContentView = true
                    game.co = Color.blue
                    game.col = Color.purple
                    game.color = Color.purple
                    game.colo = Color.blue
                    game.c = Color.purple
                }, label: {
                    Text("Colourful")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                    
                })
               
                Spacer()
            }
           
          
            
            if self.showContentView {
                ZStack {
                    ContentView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
