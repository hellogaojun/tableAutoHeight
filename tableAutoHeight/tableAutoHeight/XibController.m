//
//  XibController.m
//  tableAutoHeight
//
//  Created by gaojun on 2018/10/25.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "XibController.h"
#import "TestModel.h"
#import "XibTestCell.h"

@interface XibController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (strong, nonatomic) NSArray *dataArray;
@end

@implementation XibController

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
    XibTestCell *cell = [XibTestCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


@end
