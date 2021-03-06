//
//  ViewController.m
//  Test2
//
//  Created by 张冠清 on 2016/12/4.
//  Copyright © 2016年 张冠清. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIRefreshControl *refresh;
}
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *heightArray;
@property (nonatomic, strong) NSMutableArray *txtArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.table];
    
    refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refreshForTable) forControlEvents:UIControlEventValueChanged];
    [self.table addSubview:refresh];
    
    self.heightArray = [NSMutableArray arrayWithCapacity:4];
    [self.heightArray addObject:@40];
    [self.heightArray addObject:@40];
    [self.heightArray addObject:@40];
    [self.heightArray addObject:@40];
    [self.heightArray addObject:@40];
    
    self.txtArray = [NSMutableArray arrayWithCapacity:4];
    [self.txtArray addObject:@""];
    [self.txtArray addObject:@""];
    [self.txtArray addObject:@""];
    [self.txtArray addObject:@""];
}

-(void)refreshForTable{
    [refresh endRefreshing];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.layer.masksToBounds = YES;
    __weak typeof(self)weakSelf = self;
    
    cell.cellInfo = ^(int height,NSArray *text){
//        [self.txtArray replaceObjectAtIndex:indexPath.row withObject:text];
//        [self.heightArray replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithFloat:height]];
//        [weakSelf.table beginUpdates];
//        [weakSelf.table endUpdates];
        
    };

    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.heightArray[indexPath.row] floatValue];
}
@end
