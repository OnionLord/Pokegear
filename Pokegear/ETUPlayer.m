//
//  ETUPlayer.m
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import "ETUPlayer.h"

@implementation ETUPlayer
- (id) init {
    self = [super init];
    if (self) {
        self.activeCondition = [[ETUActiveStatusCondition alloc]init];
        self.active = [[ETUCard alloc] init]; // one active
        self.bench = [[NSMutableArray alloc] initWithCapacity:5];
        for (int i = 0; i < 5; i++)
            [self.bench addObject:[[ETUCard alloc] init]];
        
    }
    return self;
}
- (void) switchBench:(int)firstPokemonIndex with:(int)secondPokemonIndex {
    ETUCard* firstCard = self.bench[firstPokemonIndex];
    self.bench[firstPokemonIndex] = self.bench[secondPokemonIndex];
    self.bench[secondPokemonIndex] = firstCard;
}

- (void) switchActiveWith:(int)bench {
    [self.activeCondition clearStatusConditions]; // upon retreating, conditions are cleared
    ETUCard* benched = self.bench[bench];
    self.bench[bench] = self.active;
    self.active = benched;
}

- (void) damageEveryCard:(int)damage {
    self.active.damage += damage;
    for (int i = 0; i < [self.bench count]; i++)
        ((ETUCard*)self.bench[i]).damage += damage;
}

- (void) healEveryCard:(int)hp {
    ETUCard* card = self.active;
    int delta = card.damage - hp;
    card.damage = delta < 0 ? 0 : delta;
    for (int i = 0; i < [self.bench count]; i++) {
        card = self.bench[i];
        delta = card.damage - hp;
        card.damage = delta < 0 ? 0 : delta;
    }
}

@end
