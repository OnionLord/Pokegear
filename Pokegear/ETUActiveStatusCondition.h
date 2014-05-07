//
//  ETUActiveStatusCondition.h
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETUActiveStatusCondition : NSObject
@property BOOL poisoned;
@property BOOL burned;
@property int poisonDamage;
@property int burnDamage;
@property int confuseDamage;
@property int paralyzeTurn;
typedef enum {
    kNone,
    kConfused,
    kAsleep,
    kParalyzed
} RotationalStatus;
@property RotationalStatus rotationalStatus;
- (id) init;
- (void) clearStatusConditions;
- (void) paralyzeOn :(int) turn;
- (void) paralyzeOff;


// will show a warning when retreating about how conditions are wiped
- (BOOL) hasNoConditions;

@end
