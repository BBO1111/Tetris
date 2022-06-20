//
//  Menu.swift
//  Tetris
//
//  Created by mac on 03.06.2022.


import SwiftUI

struct Menu: View {
    @State private var showContentView = false
    @EnvironmentObject var game: TetrisViewModel
    
    var body: some View {
        ZStack {
        VStack {
          Spacer()
            if game.isPause {
                Text("PAUSED:")
                    .foregroundColor(game.co)
                    .font(.largeTitle.weight(.bold))
            }
            Spacer()
            
            Button {
                game.isMenu = false
                 game.newGame(speed: game.speed)
            } label: {
                Text( "RESTART" )
                    .padding(20)
                    .foregroundColor(game.colo)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity)
                    .background(game.color)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .padding(40)
            }
            Button {
                game.isPause = false
               
            } label: {
                    
                Text("CONTINUE")
                    .padding(20)
                    .foregroundColor(game.colo)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity)
                    .background(game.color)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .padding(40)
            }
            Spacer()
            
        }
            
        
            if self.showContentView {
                ZStack{
                    
                  ContentView()
                   
                }
            }
        }
    }
}
    

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

