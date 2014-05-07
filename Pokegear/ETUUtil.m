//
//  ETUUtil.m
//  Pokegear
//
//  Created by Evin Ugur on 5/6/14.
//  Copyright (c) 2014 evinugur. All rights reserved.
//

#import "ETUUtil.h"
#include <stdlib.h>
@implementation ETUUtil
+ (int) dice {
    return arc4random() % 6;
}
@end
