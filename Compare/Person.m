//
//  Person.m
//  Compare
//
//  Created by 曹林 on 16/8/30.
//  Copyright © 2016年 曹林. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSComparisonResult)compareWithHeight:(Person *)per {
    if (per.height > self.height) {
        return NSOrderedAscending;
        
    } else if (per.height == self.height){
        return NSOrderedSame;
        
    } else {
        return NSOrderedDescending;
        
    }
}

- (NSComparisonResult)comparewithWeight:(Person *)per {
    if (per.Weight > self.Weight) {
        return NSOrderedAscending;
        
    } else if (per.Weight == self.Weight) {
        return NSOrderedSame;
        
    } else {
        return NSOrderedDescending;
    }
}
@end
