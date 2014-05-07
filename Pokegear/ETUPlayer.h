//
//  ETUPlayer.h
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETUCard.h"
#import "ETUActiveStatusCondition.h"
@interface ETUPlayer : NSObject
@property NSString* name;
@property ETUCard* active;
@property NSMutableArray* bench;
@property ETUActiveStatusCondition* activeCondition;
@property int winCount;
@property int loseCount;
@property int tieCount;

- (id) init;
- (void) reset;
- (void) switchBench:(int)firstPokemonIndex with:(int)secondPokemonIndex;
- (void) switchActiveWith: (int)bench;
- (void) damageEveryCard: (int) damage;
- (void) healEveryCard: (int) hp;
@end
