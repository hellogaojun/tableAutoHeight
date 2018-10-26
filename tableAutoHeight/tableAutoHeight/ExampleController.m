//
//  ExampleController.m
//  tableAutoHeight
//
//  Created by gaojun on 2018/10/25.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "ExampleController.h"
#import "XibController.h"
#import "ViewController.h"
#import "PureLayoutController.h"

@interface ExampleController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (copy, nonatomic) NSArray<NSString *> *titles;
@property (copy, nonatomic) NSArray<UIViewController *> *controllers;
@end

@implementation ExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Cell Auto Height";
    self.titles = @[@"Xib",@"Masonry",@"PureLayout"];
    self.controllers = @[[XibController new],[ViewController new],[PureLayoutController new]];
}

#pragma mark - UItableView delegate and dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellExample";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushViewController:self.controllers[indexPath.row] title:self.titles[indexPath.row]];
}


- (void)pushViewController:(UIViewController *)controller title:(NSString *)title {
    controller.navigationItem.title = title;
    [self.navigationController pushViewController:controller animated:YES];
}


@end
