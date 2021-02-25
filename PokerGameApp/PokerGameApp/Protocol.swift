//
//  Protocol.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/21.
//

import UIKit

protocol Playable {
    var name: String { get }
    func calcHandKind() -> (Int, Set<Rank>)
    func forEachPlayer(behavior: (Hand) -> ())
}
