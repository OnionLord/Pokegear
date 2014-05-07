//
//  ETUCard.m
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import "ETUCard.h"

@implementation ETUCard
- (id) init {
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}
-(void) reset {
    self.damage = 0;
    self.name = @"";
}
@end
