//
//  TetrisViewModel.swift
//  Tetris
//
//  Created by mac on 03.06.2022.
//

import Foundation
import SwiftUI

class TetrisViewModel: ObservableObject {
    
    var columns: Int {
        model.size.columns
    }
    var rows: Int {
        model.size.rows
    }
    var lastMoveLocation: CGPoint?
    var timer: Timer?
    
    
    
    @Published var isOver: Bool = false {
        
        didSet {
            if isOver {
                
                timer?.invalidate()
                
                
            } else {
                play()
            }
            isOver = isEnd
        }
    }
    @Published var isPause: Bool = false {
        
        didSet {
            if isPause {
                
                timer?.invalidate()
                
                
            } else {
                play()
            }
            isMenu = isPause
        }
    }
    @Published var isStarted: Bool {
        didSet {
            
        }
    }
    @Published var c = Color.gray
   @Published var co = Color.gray
   @Published var col = Color.blue
    @Published var colo = Color.yellow
   @Published var color = Color.black
    @Published var isEnd = true
    @Published var isMenu = true
    @Published var score: Score = Score()
    @Published var model: GameModel
    var speed: Double
    init() {
        speed=0.9
       self.model = GameModel(20, 10, TetrisViewModel.makeFigure, TetrisViewModel.makeGameField)
       isStarted = false
        self.model.onFinishGameEvent = onEndGame
        self.model.onFigureFinishMoveDownEvent = onFinishMoveDownEvent
        self.model.onBurningLineEvent = onBurningLineEvent
        
        
    }
    
    static func makeFigure(on gameField: GameField, and size: (columns:Int, rows:Int)) -> Figure {
        return Figure(FigureTemplates.allCases.randomElement()!, position: ( Int(size.columns/2), size.rows - 5), field: gameField)
    }
    
   
    
    func newGame(speed: Double) {
        self.speed = speed
        self.model = GameModel(20, 10, TetrisViewModel.makeFigure, TetrisViewModel.makeGameField)
        isStarted = true
        self.model.onFinishGameEvent = onEndGame
        self.model.onFigureFinishMoveDownEvent = onFinishMoveDownEvent
        self.model.onBurningLineEvent = onBurningLineEvent
        score.reset()
        play()
      
    }
   
   
    
    func play() {
   
        timer?.invalidate() 
        timer = Timer.scheduledTimer(withTimeInterval: speed , repeats: true) { timer in
            self.model.move()
            self.updateScreen()
        }
    }
    
    static func makeGameField(by size: (columns:Int, rows:Int)) -> GameField {
        return GameField(by: size)
    }
    
    func onEndGame() {
        isStarted = false
        isEnd = true
    }
    
    func updateScreen() {
        self.model.update()
    }
    
    func rotate() {
        if isPause {
            return
        }
        self.model.figure.rotate()
    }
    
    func onFinishMoveDownEvent(_ figure: Figure) {
        
    }
    
    func onBurningLineEvent(_ number: Int) {
        score.add(points: 50)
        
    }

}

