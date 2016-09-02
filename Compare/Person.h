//
//  Person.h
//  Compare
//
//  Created by 曹林 on 16/8/30.
//  Copyright © 2016年 曹林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float Weight;
- (NSComparisonResult)compareWithHeight:(Person *)per;
- (NSComparisonResult)comparewithWeight:(Person *)per;





@end
