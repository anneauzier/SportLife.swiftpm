//
//  Beginning.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//
import SwiftUI
import SpriteKit
import AVFoundation

public let Y_GROUND: CGFloat = -160
public let X_GROUND: CGFloat = -130
public let ZPOSITION_BASE: CGFloat = 0

public class BeginningScene: SKScene {

    var player: PlayerNode?
    var balloon: SKBalloonNode?
    
    var motorButton: SKButtonNode?
    var cognitiveButton: SKButtonNode?
    var nextBalloon: SKButtonNode?
    var backBalloon: SKButtonNode?
    var botaoaudio: SKButtonNode?
    
    var audioScene: AVAudioPlayer?
    var soundURL: URL?
    
    var indexTalk = 0
    
    var clicks = 0
    
    let talks: [String] = [
        "balao1",
        "balao2",
        "balao3",
        "balao4",
        "balao5",
        "balao6",
        "balao7",
        "balao8",
        "balao9",
        "balao10",
        "balao11",
        "balao12",
    ]
    
    
    public override func didMove(to view: SKView) {
        setupScene()
    }

    public func setupScene() {
        
            // Cenário
        
        let background = SKSpriteNode(imageNamed:  "inicio2.png")
        background.texture?.filteringMode = .nearest
        background.zPosition = ZPOSITION_BASE - 20
        self.addChild(background)
        
            // Robozinho

        self.player = PlayerNode()
        self.player?.position.y = Y_GROUND
        self.player?.position.x = X_GROUND
        self.player?.zPosition = ZPOSITION_BASE
        self.addChild(self.player!)

            // Balões de Fala

        balloon = SKBalloonNode(imageNamed: talks[indexTalk])
        balloon?.position.y -= 40
        balloon?.position.x -= 30
        balloon?.zPosition = ZPOSITION_BASE + 50
        balloon?.setScale(0.3)
        self.addChild(self.balloon!)
        
            // Botão de passar as Falas
        
        nextBalloon = SKButtonNode(imageNamed: "botaonext", clickAction: {
            self.indexTalk += 1
            
            if(self.indexTalk >= self.talks.count) {

                self.balloon?.setHide(true)
                self.nextBalloon?.setHideButton(true)
                self.backBalloon?.setHideButton(true)
                self.motorButton?.setHideButton(false)
                self.cognitiveButton?.setHideButton(false)
                
            } else {
                self.balloon?.change(imageNamed: self.talks[self.indexTalk])
                    self.backBalloon?.setHideButton(false)
            }
        })

        nextBalloon?.position = .init(x: 160, y: -190)
        nextBalloon?.zPosition = 60
        nextBalloon?.setScale(0.07)
        self.addChild(nextBalloon!)
        
        
            // Botão de voltar as falas
        
        backBalloon = SKButtonNode.self(imageNamed: "botaoback", clickAction:{
            self.indexTalk -= 1
            
            if(self.indexTalk < 0) {
    
                self.backBalloon?.setHideButton(true)
            } else {
                self.balloon?.change(imageNamed: self.talks[self.indexTalk])
            }
            
        })
        backBalloon?.position = .init(x: 125, y: -190)
        backBalloon?.zPosition = 60
        backBalloon?.setScale(0.07)
        self.addChild(backBalloon!)
        

            // Botão para Cena 2
        
        motorButton = SKButtonNode(imageNamed: "botao1", clickAction: { [weak self] in
            
            let newScene = MotorSkills()
                newScene.size = CGSize(width: 1080/2, height: 1920/2)
                newScene.scaleMode = .aspectFit
                newScene.anchorPoint = .init(x: 0.5, y: 0.5)
                self?.view?.presentScene(newScene, transition: .fade(withDuration: 1))
            
                })
                                   
        motorButton?.position = .init(x: -60, y: 10)
        motorButton?.setScale(0.2)
        self.addChild(motorButton!)
        
        motorButton?.setHideButton(true)
                
            // Botão para Cena 3
        
        cognitiveButton = SKButtonNode(imageNamed: "botao2", clickAction: { [weak self] in
                    
            let secondScene = CognitiveSkills()
                secondScene.size = CGSize(width: 1080/2, height: 1920/2)
                secondScene.scaleMode = .aspectFit
                secondScene.anchorPoint = .init(x: 0.5, y: 0.5)
                self?.view?.presentScene(secondScene, transition: .fade(withDuration: 1))
                    
                })
        
        cognitiveButton?.position = .init(x: 50, y: 10)
        cognitiveButton?.setScale(0.2)
        self.addChild(cognitiveButton!)
        cognitiveButton?.setHideButton(true)
        
            // Botão de áudio
        
        botaoaudio = SKButtonNode(imageNamed: "audioalto", clickAction: { [weak self] in
    
            if (self!.clicks == 0){
         
            self?.clicks += 1
                let soundPath = Bundle.main.path(forResource: "music", ofType: "mp3")!
                self?.soundURL = URL(fileURLWithPath: soundPath)

            do{
                self?.audioScene = try AVAudioPlayer(contentsOf: (self?.soundURL!)!)
                self?.audioScene?.play()
                    }
            catch{
                print(error)
                }
            }
            else if (self!.clicks == 1){
                self?.clicks -= 1
                self?.audioScene?.pause()
            }
        })
        
        botaoaudio?.position = .init(x: 150, y: 190)
        botaoaudio?.setScale(0.05)
        self.addChild(botaoaudio!)
  
    }
}


