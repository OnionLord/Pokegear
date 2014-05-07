//
//  ETUGameManager.m
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import "ETUGameManager.h"
@implementation ETUGameManager
- (id) init {
    self = [super init];
    if (self) {
        self.one = [[ETUPlayer alloc] init];
        self.two = [[ETUPlayer alloc] init];
        [self reset];
    }
  // TODO  [self changeTurns:false];
    return self;
}

- (void) reset {
    [self.one reset];
    [self.two reset];
    self.turnState = true;
    self.turnCount = 1;
}

-(void) changeTurns:(BOOL)attackOrPass attack:(int)damage {
    ETUPlayer *currentPlayer = self.turnState ? self.one : self.two;
    ETUPlayer *opposingPlayer = currentPlayer == self.one ? self.two : self.one;
    ETUActiveStatusCondition *condition = currentPlayer.activeCondition;

    RotationalStatus status = condition.rotationalStatus;
    // first handle if we attack
    
    if (attackOrPass) {
        // first check if the current player is asleep, confused, etc
        RotationalStatus status = condition.rotationalStatus;
        if (status == kNone)
            opposingPlayer.active.damage += damage;
        else if (status == kConfused) {
            // we can still do damage via coin flip...
            if ([ETUUtil dice] % 2 == 0) {
                NSLog(@" Despite being confused you flipped heads!");
                opposingPlayer.active.damage += damage;
            }
            else {
                NSLog(@"You didn't damage the foe, and instead you damaged yourself");
                currentPlayer.active.damage += condition.confuseDamage;
            }
        }
        else {
            NSLog(@"You were unable to attack this turn!");
        }
    }
    
    // regardless of whether or not we attacked, the turn is over.
    
    if (condition.poisoned) {
        currentPlayer.active.damage += condition.poisonDamage;
        NSLog(@"You received damage from poison!");
    }
    
    if (condition.burned) {
        if ([ETUUtil dice] % 2 == 0) {
            NSLog(@"You did not receive burn damage this turn!");
        }
        else {
            currentPlayer.active.damage += condition.burnDamage;
            NSLog(@"You did receive burn damage this turn!");
        }
    }
    
    // test out of rotational statuses
    
    if (status == kAsleep && [ETUUtil dice] % 2 == 0) {
        condition.rotationalStatus = kNone;
        NSLog(@"you woke up");
    }
    else {
        NSLog(@"you're still asleep");
    }
    
    if (status == kParalyzed && self.turnCount  - condition.paralyzeTurn >= 2) {
        [condition paralyzeOff];
        NSLog(@"You are no longer paralyzed!");
    }
    
    self.turnState = !self.turnState;
    self.turnCount++;

}
-(void) finishWithTie {
    self.one.tieCount++;
    self.two.tieCount++;
    [self reset];
}
-(void) finish:(ETUPlayer *)winner {
    ETUPlayer *a = winner == self.one ? self.one : self.two;
    ETUPlayer *b = a == self.one ? self.two : self.one;
    a.winCount++;
    b.loseCount--;
    [self reset];
}

@end
