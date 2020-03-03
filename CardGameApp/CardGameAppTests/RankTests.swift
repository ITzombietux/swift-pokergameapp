//
//  RankTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/03/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp

class RankTests: XCTestCase {
    
    func testIsFourCardSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four),
                     Card(suit: .spade, number: .four)]
        // 3. then
        if let num = Participant.Combination.isFourCard(cards: cards) {
            XCTAssertEqual(num, Card.Number.four)
        }
    }
    
    func testIsFourCardFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four)]
         // 3. then
        XCTAssertNil(Participant.Combination.isFourCard(cards: cards))
    }
    
    func testIsStraightSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .four),
                     Card(suit: .spade, number: .four)]
         // 3. then
        XCTAssertEqual(Participant.Combination.isStraight(cards: cards), Card.Number.five)
    }
    
    func testIsStraightFail() {
        // 1. given
        var cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .six),
                     Card(suit: .spade, number: .seven)]
         // 3. then
        XCTAssertNil(Participant.Combination.isStraight(cards: cards))
        
        // 1. given
        cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .five),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .six),
                     Card(suit: .spade, number: .seven)]
         // 3. then
        XCTAssertNil(Participant.Combination.isStraight(cards: cards))
    }
    
    func testIsTripleSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .ace),
                     Card(suit: .spade, number: .five)]
        
         // 3. then
        XCTAssertEqual(Participant.Combination.isTriple(cards: cards), Card.Number.two)
    }

    func testIsTripleFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .ace),
                     Card(suit: .spade, number: .five)]
         // 3. then
        XCTAssertNil(Participant.Combination.isTriple(cards: cards))
    }
    
    func testIsTwoPairSuccess() {
        // 1. given
         let cards = [Card(suit: .club, number: .two),
                      Card(suit: .club, number: .two),
                      Card(suit: .club, number: .four),
                      Card(suit: .diamond, number: .four),
                      Card(suit: .heart, number: .three),
                      Card(suit: .spade, number: .three)]
          // 3. then
        XCTAssertEqual(Participant.Combination.isTwoPair(cards: cards), Card.Number.four)
    }
    
    func testIsTwoPairFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
         // 3. then
        XCTAssertNil(Participant.Combination.isTwoPair(cards: cards))
    }
    
    func testIsOnePairSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
        
        // 3. then
        XCTAssertEqual(Participant.Combination.isOnePair(cards: cards), Card.Number.two)
    }
    
    func testIsOnePairFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .jack),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
        
        // 3. then
        XCTAssertNil(Participant.Combination.isOnePair(cards: cards))
    }
}
