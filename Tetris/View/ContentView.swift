//
//  ContentView.swift
//  Tetris
//
//  Created by mac on 03.06.2022.


import SwiftUI

struct ContentView: View {
    @State private var showGameTetrisView = false
    @EnvironmentObject var game: TetrisViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
            VStack() {
                Spacer()
                Text("TETRIS GAME")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(game.color)
                Spacer()
                Spacer()
                Text("Pick the level:")
                    .font(.title.weight(.semibold))
                    .foregroundColor(game.co)
                Button(action: {
                    game.isEnd = false
                    game.isMenu = false
                    showGameTetrisView.toggle()
                   game.newGame(speed: 0.9)
                    
                }, label: {
                    Text("EASY")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(game.colo)
                        .frame(maxWidth: .infinity)
                        .background(game.color)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                })
                Button(action: {
                    game.isEnd = false
                    game.isMenu = false
                    
                    game.newGame(speed: 0.4)
                    showGameTetrisView.toggle()
                   
                }, label: {
                    Text("AVERAGE")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(game.colo)
                        .frame(maxWidth: .infinity)
                        .background(game.color)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                    
                })
                Button(action: {
                    game.isEnd = false
                    game.isMenu = false
                    showGameTetrisView.toggle()
                   game.newGame(speed: 0.1)
                }, label: {
                    Text("IMPOSSIBLE")
                        .padding(20)
                        .font(.title.weight(.bold))
                        .foregroundColor(game.colo)
                        .frame(maxWidth: .infinity)
                        .background(game.color)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(40)
                    
                })
                Spacer()
            }
           
          
            
            if self.showGameTetrisView {
                ZStack {
                    GameTetrisView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
