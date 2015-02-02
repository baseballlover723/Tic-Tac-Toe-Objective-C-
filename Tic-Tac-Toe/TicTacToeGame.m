//
//  TicTacToeGame.m
//  Tic-Tac-Toe
//
//  Created by Philip Ross on 1/20/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

- (id) init {
    self = [super init];
    if (self) {
        self.gameState = GameStateXTurn;
        for (int i=0; i<9; i++) {
            gameBoard[i] = MarkTypeNone;
        }
    }
    return self;
}

- (void) pressedSquare:(NSInteger) index;{
    NSLog(@"Called pressed square on index %d", (int) index);
    if (gameBoard[index] != MarkTypeNone || self.gameState == GameStateOWon || self.gameState == GameStateXWon) {
        return;
    }
    
    if (self.gameState == GameStateXTurn) {
        gameBoard[index] = MarkTypeX;
        self.gameState = GameStateOTurn;
        [self checkForGameOver];
    } else {
        gameBoard[index] = MarkTypeO;
        self.gameState = GameStateXTurn;
        [self checkForGameOver];
    }
}

- (void) checkForGameOver {
    if (![[self getGameBoardString] containsString:@"-"]) {
        self.gameState = GameStateTie;
    }
    
    NSMutableArray* linesOf3 = [[NSMutableArray alloc] init];
    [linesOf3 addObject: [self getStringForLocation1: 0 location2: 1 location3: 2]];
    [linesOf3 addObject: [self getStringForLocation1: 3 location2: 4 location3: 5]];
    [linesOf3 addObject: [self getStringForLocation1: 6 location2: 7 location3: 8]];

    [linesOf3 addObject: [self getStringForLocation1: 0 location2: 3 location3: 6]];
    [linesOf3 addObject: [self getStringForLocation1: 1 location2: 4 location3: 7]];
    [linesOf3 addObject: [self getStringForLocation1: 2 location2: 5 location3: 8]];

    [linesOf3 addObject: [self getStringForLocation1: 0 location2: 4 location3: 8]];
    [linesOf3 addObject: [self getStringForLocation1: 2 location2: 4 location3: 6]];
    
    for (NSString* lineOf3 in linesOf3) {
        if ([lineOf3 isEqualToString: @"XXX"]) {
            self.gameState = GameStateXWon;
        } else if ([lineOf3 isEqualToString: @"OOO"]) {
            self.gameState = GameStateOWon;
        }
    }
}

- (NSString*) getStringForLocation1: (NSInteger) index1
                          location2: (NSInteger) index2
                          location3: (NSInteger) index3 {
    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
    [gameBoardString appendString: [self getMarkTypeString: gameBoard[index1]]];
    [gameBoardString appendString: [self getMarkTypeString: gameBoard[index2]]];
    [gameBoardString appendString: [self getMarkTypeString: gameBoard[index3]]];
    return gameBoardString;
    
}

- (NSString*) getGameStateString {
    switch (self.gameState) {
        case GameStateXTurn:
            return @"X's Turn";
        case GameStateOTurn:
            return @"O's Turn";
        case GameStateXWon:
            return @"X Wins!";
        case GameStateOWon:
            return @"O Wins!";
        case GameStateTie:
            return @"Cats Game";
    }
}

- (NSString*) getGameBoardString {
    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
    for (int i=0; i<9; i++) {
        [gameBoardString appendString: [self getMarkTypeString: gameBoard[i]]];
    }
    
    
    return gameBoardString;
}

- (NSString*) getMarkTypeString: (MarkType) markType {
    switch (markType) {
        case MarkTypeNone:
            return @"-";
        case MarkTypeX:
            return @"X";
        case MarkTypeO:
            return @"O";
    }
}

- (MarkType) getMarkTypeAtIndex:(NSInteger) index {
    return gameBoard[index];
}

- (NSString*) description {
    return [NSString stringWithFormat: @"%@  Board: %@", [self getGameStateString], [self getGameBoardString]];
}

@end
