//
//  ViewController.m
//  tableAutoHeight
//
//  Created by bfd on 2018/9/12.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "TestModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.dataArray = [TestModel dataList];
    self.tableV.estimatedRowHeight = 100;
    self.tableV.rowHeight = UITableViewAutomaticDimension;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [TestCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


@end
