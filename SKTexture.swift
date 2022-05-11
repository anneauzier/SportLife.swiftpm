//
//  SKTexture.swift
//  SportLife
//
//  Created by Anne Victoria Batista Auzier on 14/04/22.
//

import Foundation
import SpriteKit

public extension Array where Element == SKTexture {
    init (withFormat format: String, range: ClosedRange<Int>) {
        self = range.map({ (index) in
            let imageNamed = String(
                format: format, "\(index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}
