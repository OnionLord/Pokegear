//
//  ETUGameManager.h
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETUPlayer.h"
#import "ETUUtil.h"
@interface ETUGameManager : NSObject
@property ETUPlayer *one;
@property ETUPlayer *two;

@property int turnCount;

@property BOOL turnState;


- (id) init;

- (void) changeTurns :(BOOL)attackOrPass attack:(int)damage;

@end
