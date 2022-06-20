//
//  Menu.swift
//  Tetris
//
//  Created by mac on 03.06.2022.
//

import SwiftUI

struct GameOver: View {
    @State private var showMainView = false
    @EnvironmentObject var game: TetrisViewModel
    
    var body: some View {
        ZStack {
        VStack {
          Spacer()
            if game.isEnd {
                VStack{
                    
                Text("GAME OVER:")
                    .foregroundColor(game.co)
                    .font(.largeTitle.weight(.bold))
                    Text("Your final score is \(game.score.points):")
                        .foregroundColor(game.co)
                        .font(.largeTitle.weight(.bold))
                }
            }
            Spacer()
            
            Button {
                game.isEnd = false
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
                
               showMainView = true
            } label: {
                    
                Text("HOMESCREEN")
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
            
        
            if self.showMainView {
                ZStack{
                    
                  MainView()
                   
                }
            }
        }
    }
}
    

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver()
    }
}

