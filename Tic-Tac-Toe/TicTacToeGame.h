//
//  TicTacToeGame.h
//  Tic-Tac-Toe
//
//  Created by Philip Ross on 1/20/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MarkType) {
    MarkTypeNone,
    MarkTypeX,
    MarkTypeO
};

typedef NS_ENUM(NSInteger, GameState) {
    GameStateXTurn,
    GameStateOTurn,
    GameStateXWon,
    GameStateOWon,
    GameStateTie
};

@interface TicTacToeGame : NSObject {
    // i var
    MarkType gameBoard[9];
}

@property (nonatomic) GameState gameState;

- (void) pressedSquare:(NSInteger) index;
- (void) checkForGameOver;
- (NSString*) getGameStateString;
- (NSString*) getGameBoardString;
- (NSString*) getMarkTypeString: (MarkType) markType;
- (MarkType) getMarkTypeAtIndex:(NSInteger) index;


@end
