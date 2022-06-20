//
//  GameTetrisView.swift
//  Tetris
//
//  Created by mac on 03.06.2022.


import SwiftUI

struct GameTetrisView: View {
    @State private var showMainView = false
    @EnvironmentObject var game: TetrisViewModel
    @State var sizePauseButton: CGFloat = 30
    
   var body: some View {
        ZStack{
    
            VStack {
                HStack{
                StatusBarView()
                    .frame(width: 300, height: 40)
                    
                    Button {
                        showMainView = true
                       
                    } label: {
                        Image(systemName: "house.circle")
                            .resizable()
                            .foregroundColor(game.c)
                            .frame(width: sizePauseButton, height: sizePauseButton)
                    }
                    
                }
                
                       
                if game.isEnd {
                  GameOver()
                    
                        .frame(width: 450, height: 600)
                    
                }
                else if game.isMenu {
                    Menu()
                          .frame(width: 450, height: 600)
                      
                  }
                
                else {
                            VStack{
                            GameView()
                                .frame(width: 450, height: 600)
                                Spacer()
                            ControlPanelView()
                                .frame(width: 335, height: 100)
                                .padding(.top, 50)
                            }
                        }
                Spacer()
                Spacer()
                Spacer()
              
            }
        if self.showMainView {
            ZStack{
                
              MainView()
               
            }
        }
    }
        .background(Color.black)
    }
}


