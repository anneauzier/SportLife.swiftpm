import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
            let scene = BeginningScene()
            scene.size = CGSize(width: 1080/2, height: 1920/2)
            scene.scaleMode = .aspectFit
            scene.anchorPoint = .init(x: 0.5, y: 0.5)
            return scene
        }

        var body: some View {
            SpriteView(scene: scene)
                .frame(width: 1080/2, height: 1920/2)
                .ignoresSafeArea()
        }
}

