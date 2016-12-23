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
}

-(void)refreshForTable{
    [refresh endRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    __weak typeof(self)weakSelf = self;
    cell.getHeight = ^(CGFloat height){
        [weakSelf.table beginUpdates];
        [weakSelf.table endUpdates];
    };
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
@end
