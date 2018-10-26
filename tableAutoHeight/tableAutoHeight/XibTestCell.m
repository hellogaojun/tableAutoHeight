//
//  XibTestCell.m
//  tableAutoHeight
//
//  Created by gaojun on 2018/10/26.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "XibTestCell.h"

@interface XibTestCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;


@end
@implementation XibTestCell
static NSString * const ID = @"XibTestCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    XibTestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    }
    return cell;
}

- (void)setModel:(TestModel *)model {
    self.label.text  = model.title;
    self.label2.text = model.subTitle;

}

@end
