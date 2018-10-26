//
//  PureLayoutCell.h
//  tableAutoHeight
//
//  Created by gaojun on 2018/10/26.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PureLayoutCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) TestModel *model;

@end

NS_ASSUME_NONNULL_END
