//
//  ETUActiveStatusCondition.m
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import "ETUActiveStatusCondition.h"

@implementation ETUActiveStatusCondition
- (id) init {
    self = [super init];
    if (self) {
        [self clearStatusConditions];
        self.poisonDamage = 10;
        self.burnDamage = 20;
        self.confuseDamage = 30;
    }
    return self;
}

- (void) clearStatusConditions {
    self.rotationalStatus = kNone;
    self.poisoned = false;
    self.burned = false;
}
@end
