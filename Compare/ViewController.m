//
//  ViewController.m
//  Compare
//
//  Created by 曹林 on 16/8/30.
//  Copyright © 2016年 曹林. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person  alloc] init];
    person.name = @"张三";
    person.height = 175;
    person.Weight = 100;
    
    
    Person *person1 = [[Person  alloc] init];
    person1.name = @"Lisi";
    person1.height = 195;
    person1.Weight = 86;
    
    Person *person2 = [[Person  alloc] init];
    person2.name = @"Lisi";
    person2.height = 125;
    person2.Weight = 86;
    
    NSArray *array = @[person, person1,person2];
    
    for (Person *p1 in array) {
        NSLog(@"p1.height = %f",p1.height);
        
    }
  
    NSArray *newArray = [array sortedArrayUsingSelector:@selector(compareWithHeight:)];
    for (Person *p in newArray) {
        NSLog(@"p.height = %f",p.height);
        
    }
    NSLog(@"%@",newArray);
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
