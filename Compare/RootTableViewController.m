//
//  RootTableViewController.m
//  Compare
//
//  Created by 曹林 on 16/8/30.
//  Copyright © 2016年 曹林. All rights reserved.
//

#import "RootTableViewController.h"
#import "Person.h"

@interface RootTableViewController ()
@property (nonatomic, strong) NSMutableArray *datalist;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //dispatch_queue_t queue = dispatch_queue_create("www.heima", NULL);
    self.datalist = [NSMutableArray array];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    dispatch_queue_t queue = dispatch_get_global_queue(  DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        Person *person = [[Person  alloc] init];
        person.name = @"张三";
        person.height = 175;
        person.Weight = 100;
        
        
        Person *person1 = [[Person  alloc] init];
        person1.name = @"Lisi";
        person1.height = 195;
        person1.Weight = 86;
        
        Person *person2 = [[Person  alloc] init];
        person2.name = @"wangfu";
        person2.height = 125;
        person2.Weight = 300;
        
        NSArray *array = @[person, person1,person2];
        [self.datalist addObject:array];
        
        
        
        for (Person *p1 in array) {
            NSLog(@"p1.height = %f",p1.height);
            
        }
        
        NSArray *newArray = [array sortedArrayUsingSelector:@selector(compareWithHeight:)];
        for (Person *p in newArray) {
            NSLog(@"p.height = %f",p.height);
            
        }
        [self.datalist addObject:newArray];
        NSLog(@"%@",newArray);
        
        NSArray *weight = [array sortedArrayUsingSelector:@selector(comparewithWeight:)];
        [self.datalist addObject:weight];
        [self.tableView reloadData];
        
        
        
        
    });

    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.datalist.count;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.datalist[section];
    
#warning Incomplete implementation, return the number of rows
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static  NSString *ID = @"cell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    NSArray *array = self.datalist[indexPath.section];
    Person *p = array[indexPath.row];
    
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0f",p.Weight];
    
    
    
    
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
