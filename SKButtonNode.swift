//
//  SKButtonNode.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SpriteKit

class SKButtonNode: SKNode {
    let image: SKSpriteNode
    //let text: SKLabelNode
    
    var clickAction: () -> ()
    var unclickAction: (() -> ())?
    
    init(imageNamed name:String, text: String = "", clickAction: @escaping () -> (), unclickAction: (() -> ())? = nil) {
        //self.text = SKLabelNode(text: text)
        self.image = SKSpriteNode(imageNamed: name)
        self.image.texture?.filteringMode = .nearest
        self.clickAction = clickAction
        self.unclickAction = unclickAction
        super.init()
        
        self.image.zPosition -= 1
        
        self.addChild(self.image)
        
//        self.image.setScale(0.2)

        self.isUserInteractionEnabled = true
        
//        self.text.verticalAlignmentMode = .center
//        self.text.fontName = "Futura"
//        self.text.fontColor = .black
//        self.text.fontSize = 16
//        self.zPosition -= 1
//        self.addChild(self.text)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clickAction()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        unclickAction?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        unclickAction?()
    }
    
    public func setHideButton(_ value: Bool) {
        if(value) {
            self.run(.sequence([
                .hide()
            ]))
        } else {
            self.run(.sequence([
                .unhide(),
            ]))
            
            }
        }
}

