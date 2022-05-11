//
//  File.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 19/04/22.
//

import Foundation
import SpriteKit
class PlayerNode2: SKNode {
    
    public override init() {
        super.init()
        let sprite2 = SKSpriteNode(imageNamed: "robo_idle")
        sprite2.texture?.filteringMode = .nearest
        
        self.addChild(sprite2)
        sprite2.run(.repeatForever(.animate(with: .init(withFormat: "robo_idle%@", range: 3...4), timePerFrame: 5)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
