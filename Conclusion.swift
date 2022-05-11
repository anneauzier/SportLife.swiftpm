//
//  Conclusion.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SpriteKit
//import AVFoundation

public class Conclusion: SKScene{
    
    var player2: PlayerNode2?
    var balloon_4: SKBalloonNode?
    var nextButton4: SKButtonNode?
    var backBalloon2: SKButtonNode?
    
   // var audioScene: AVAudioPlayer?
    
    var indexTalk5 = 0
    
    var talks5: [String] = [
        "balaosc9",
        "balaosc10",
        "balaosc11",
        "balaosc12",
        "balaosc13",
        "balaosc14",
    ]
    
    public override func didMove(to view: SKView) {
        setupScene_4()
    }
    
    public func setupScene_4(){
        
        // Cenário
        
        let background_4 = SKSpriteNode(imageNamed: "inicio2.png")
        background_4.texture?.filteringMode = .nearest
        background_4.zPosition = ZPOSITION_BASE - 20
        self.addChild(background_4)
        
        // Robozinho
        
        self.player2 = PlayerNode2()
        self.player2?.position.y = -160
        self.player2?.position.x = 8
        self.player2?.zPosition = ZPOSITION_BASE
        self.addChild(self.player2!)
        
        // Balão
        
        balloon_4 = SKBalloonNode(imageNamed: "balaosc9")
            balloon_4?.position.y -= 10
            balloon_4?.position.x -= -10
            balloon_4?.zPosition = ZPOSITION_BASE + 50
            balloon_4?.setScale(0.32)
            self.addChild(self.balloon_4!)
        
        // Botão de avançar
    
        nextButton4 = SKButtonNode(imageNamed: "botaonext", clickAction: {
            self.indexTalk5 += 1
            
            if(self.indexTalk5 >= self.talks5.count) {
                // Acabou e agora faz outra coisa
                self.nextButton4?.setHideButton(true)
                self.backBalloon2?.setHideButton(true)
            } else {
                self.balloon_4?.change(imageNamed: self.talks5[self.indexTalk5])
            }
    })
            nextButton4?.position = .init(x: 160, y: -190)
            nextButton4?.zPosition = 60
            nextButton4?.setScale(0.07)
            self.addChild(nextButton4!)
        
        
        // Botão de recuar
        
        backBalloon2 = SKButtonNode.self(imageNamed: "botaoback", clickAction:{
            self.indexTalk5 -= 1
            
            if(self.indexTalk5 < 0) {
                let penultimateScene3 = BothSkills()
                penultimateScene3.size = CGSize(width: 1080/2, height: 1920/2)
                penultimateScene3.scaleMode = .aspectFit
                penultimateScene3.anchorPoint = .init(x: 0.5, y: 0.5)
                self.view?.presentScene(penultimateScene3, transition: .fade(withDuration: 1))
                                        
         }else {
                self.balloon_4?.change(imageNamed: self.talks5[self.indexTalk5])
            }
            
        })
        backBalloon2?.position = .init(x: 125, y: -190)
        backBalloon2?.zPosition = 60
        backBalloon2?.setScale(0.07)
        self.addChild(backBalloon2!)
        
    }
}
