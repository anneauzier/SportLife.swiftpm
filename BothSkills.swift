//
//  BothSkills.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SpriteKit

public class BothSkills: SKScene{
    
    var balloon_3: SKBalloonNode?
    
    var indexTalk4 = 0
    
    var talks4: [String] = [
        "balaosc7",
        "balaosc8",
    ]
    
    public override func didMove(to view: SKView) {
        setupScene_3()
    }
    
    public func setupScene_3(){
        let background_3 = SKSpriteNode(imageNamed: "futebol.png")
        background_3.texture?.filteringMode = .nearest
        background_3.zPosition = ZPOSITION_BASE - 20
        self.addChild(background_3)
        
        balloon_3 = SKBalloonNode(imageNamed: "balaosc7")
            balloon_3?.position.y -= -100
            balloon_3?.position.x -= -8
            balloon_3?.zPosition = ZPOSITION_BASE + 50
            balloon_3?.setScale(0.25)
            self.addChild(self.balloon_3!)
            
        let nextButton3 = SKButtonNode(imageNamed: "botaonext", clickAction: { [weak self] in
            
            self?.indexTalk4 += 1
            
            if(self?.indexTalk4 ?? 0 >= (self?.talks4.count)!)
            {
                let lastScene = Conclusion()
                    lastScene.size = CGSize(width: 1080/2, height: 1920/2)
                    lastScene.scaleMode = .aspectFit
                    lastScene.anchorPoint = .init(x: 0.5, y: 0.5)
                    self?.view?.presentScene(lastScene, transition: .fade(withDuration: 1))
            }
            else{
                self?.balloon_3?.change(imageNamed: (self?.talks4[self!.indexTalk4])!)
            }
        })
        
        nextButton3.position = .init(x: 150, y: 50)
        nextButton3.zPosition = 60
        nextButton3.setScale(0.07)
        self.addChild(nextButton3)
        
    }
    
}
