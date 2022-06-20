//
//  TetrisApp.swift
//  Tetris
//
//  Created by mac on 03.06.2022.
//

import SwiftUI

@main
struct TetrisApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(TetrisViewModel())
        }
    }
}

