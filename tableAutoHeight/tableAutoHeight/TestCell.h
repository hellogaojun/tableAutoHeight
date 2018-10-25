//
//  TestCell.h
//  tableAutoHeight
//
//  Created by bfd on 2018/9/12.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"

@interface TestCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) TestModel *model;
@end
