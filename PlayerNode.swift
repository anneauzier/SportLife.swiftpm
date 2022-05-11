//
//  PlayerNode.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import SpriteKit
class PlayerNode: SKNode {
    
    public override init() {
        super.init()
        let sprite = SKSpriteNode(imageNamed: "robo_idle")
        sprite.texture?.filteringMode = .nearest
        
        self.addChild(sprite)
        sprite.run(.repeatForever(.animate(with: .init(withFormat: "robo_idle%@", range: 1...2), timePerFrame: 14)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
