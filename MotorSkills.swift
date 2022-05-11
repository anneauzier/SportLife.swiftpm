//
//  MotorSkills.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SwiftUI
import SpriteKit

public class MotorSkills: SKScene{
    
    var playerSwim: PlayerNode?
    var balloon_1: SKBalloonNode?
    public let ZPOSITION_BASE1: CGFloat = 0
    
    var indexTalk2 = 0
    
    let talks2: [String] = [
        "balaosc1",
        "balaosc2",
        "balaosc3",
    ]

    public override func didMove(to view: SKView) {
            setupScene_1()
    }

    public func setupScene_1(){
        
        let background_1 = SKSpriteNode(imageNamed: "natacao2.png")
        background_1.texture?.filteringMode = .nearest
        background_1.zPosition = ZPOSITION_BASE - 20
        self.addChild(background_1)
        
        
        // Robozinho na Piscina
        
        self.playerSwim = PlayerNode()
        self.playerSwim?.position.y = 95
        self.playerSwim?.position.x = -130
        self.playerSwim?.zPosition = ZPOSITION_BASE
        self.playerSwim?.setScale(0.85)
        self.addChild(self.playerSwim!)
        
        // Balões cena 2
        
        balloon_1 = SKBalloonNode(imageNamed: "balaosc1")
        balloon_1?.position.y -= -180
        balloon_1?.position.x -= -40
        balloon_1?.zPosition = ZPOSITION_BASE + 50
        balloon_1?.setScale(0.2)
        self.addChild(self.balloon_1!)
            
        // Botão para passar
        
        let nextButton = SKButtonNode(imageNamed: "botaonext", clickAction: { [weak self] in
            self?.indexTalk2 += 1
            
            if(self?.indexTalk2 ?? 0 >= (self?.talks2.count)!)
            {
                let penultimateScene = BothSkills()
                    penultimateScene.size = CGSize(width: 1080/2, height: 1920/2)
                    penultimateScene.scaleMode = .aspectFit
                    penultimateScene.anchorPoint = .init(x: 0.5, y: 0.5)
                    self?.view?.presentScene(penultimateScene, transition: .fade(withDuration: 1))

            }
            else{
                self?.balloon_1?.change(imageNamed: (self?.talks2[self!.indexTalk2])!)
            }
        
        })
        
        nextButton.position = .init(x: 160, y: 140)
        nextButton.zPosition = 60
        nextButton.setScale(0.07)
        self.addChild(nextButton)
        
    }
    
}
