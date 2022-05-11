//
//  CognitiveSkills.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SpriteKit

public class CognitiveSkills: SKScene{
    
    var playerChess: PlayerNode?
    var balloon_2: SKBalloonNode?
    
    var indexTalk3 = 0
    
    let talks3: [String] = [
        "balaosc4",
        "balaosc5",
        "balaosc6",
    ]
    
    public override func didMove(to view: SKView) {
        setupScene_2()
    }
    
    public func setupScene_2(){
        let background_2 = SKSpriteNode(imageNamed: "xadrez4.png")
        background_2.texture?.filteringMode = .nearest
        background_2.zPosition = ZPOSITION_BASE - 20
        self.addChild(background_2)
        
        
        self.playerChess = PlayerNode()
                self.playerChess?.position.y = -1
                self.playerChess?.position.x = -80
                self.playerChess?.zPosition = ZPOSITION_BASE
                self.playerChess?.setScale(0.85)
                self.addChild(self.playerChess!)
        
        
        balloon_2 = SKBalloonNode(imageNamed: "balaosc4")
            balloon_2?.position.y -= -130
            balloon_2?.position.x -= -40
            balloon_2?.zPosition = ZPOSITION_BASE + 50
            balloon_2?.setScale(0.3)
            self.addChild(self.balloon_2!)
                
        
        let nextButton2 = SKButtonNode(imageNamed: "botaonext", clickAction: { [weak self] in
            
            self?.indexTalk3 += 1
            
            if(self?.indexTalk3 ?? 0 >= (self?.talks3.count)!)
            {
                let penultimateScene2 = BothSkills()
                penultimateScene2.size = CGSize(width: 1080/2, height: 1920/2)
                penultimateScene2.scaleMode = .aspectFit
                penultimateScene2.anchorPoint = .init(x: 0.5, y: 0.5)
                self?.view?.presentScene(penultimateScene2, transition: .fade(withDuration: 1))
            }
            else{
                self?.balloon_2?.change(imageNamed: (self?.talks3[self!.indexTalk3])!)
            }
        })

        nextButton2.position = .init(x: 160, y: 75)
        nextButton2.zPosition = 60
        nextButton2.setScale(0.07)
        self.addChild(nextButton2)
    }
    
}
