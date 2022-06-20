//
//  StatusBarView.swift
//  Tetris
//
//  Created by mac on 03.06.2022.
//

import SwiftUI

struct StatusBarView: View {
    
    @EnvironmentObject var game: TetrisViewModel
    
    @State var sizePauseButton: CGFloat = 30
    
    var body: some View {
        ZStack {
        HStack {
            Text("Score:")
                .font(.title.weight(.bold))
                .foregroundColor(game.c)
                
            Text("\(game.score.points)")
                .font(.title.weight(.bold))
                .foregroundColor(game.c)
                
         
            Spacer()
            Button {
                game.isPause.toggle()
               
            } label: {
                if game.isPause {
                    Image(systemName: "play.circle")
                        .resizable()
                        .foregroundColor(game.c)
                        .frame(width: sizePauseButton, height: sizePauseButton)
                } else {
                    Image(systemName: "pause.circle")
                        .resizable()
                        .foregroundColor(game.c)
                        .frame(width: sizePauseButton, height: sizePauseButton)
                }
                
            }
        }
           
        }
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
