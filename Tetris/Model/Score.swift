//
//  Score.swift
//  Tetris
//
//  Created by mac on 03.06.2022.


import Foundation

struct Score {
    private(set) var points: Int = 0
    
    init(points: Int = 0) {
        self.points = points
    }
    
    mutating func add(points: Int) {
        self.points += points
    }
    
    mutating func reset() {
        points = 0
    }
}
