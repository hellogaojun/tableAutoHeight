//
//  PureLayoutCell.m
//  tableAutoHeight
//
//  Created by gaojun on 2018/10/26.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "PureLayoutCell.h"
#import "PureLayout.h"

@interface PureLayoutCell ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIImageView *imView;

@end

@implementation PureLayoutCell
static NSString * const ID = @"TestCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    PureLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PureLayoutCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setModel:(TestModel *)model {
    _model = model;
    
    self.label.text  = model.title;

    self.label2.text = model.subTitle;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imView];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label2];
        [self layout];
        
        //TODO:此处设置防止一开始cell默认高度带来的问题
        [self layoutIfNeeded];
    }
    return self;
}

/**
 [self.imView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.width.height.mas_equalTo(50);
 make.left.top.mas_equalTo(15);
 }];
 
 [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
 make.top.mas_equalTo(0);
 make.left.equalTo(self.imView.mas_right).mas_equalTo(10);
 make.right.mas_equalTo(-15);
 }];
 
 [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.equalTo(self.label);
 make.top.equalTo(self.label.mas_bottom).mas_equalTo(15);
 make.right.equalTo(self.label);
 make.bottom.mas_equalTo(-20);
 }];
 **/

- (void)layout {
    [self.imView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [self.imView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.imView autoSetDimensionsToSize:CGSizeMake(50, 50)];
    
    [self.label autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.label autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imView withOffset:10];
    [self.label autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-15];
    
    [self.label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.label];
    [self.label2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.label];
    [self.label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.label withOffset:15];
    [self.label2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
 }


- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = [UIColor redColor];
        _label.backgroundColor = [UIColor grayColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [UILabel new];
        _label2.textColor = [UIColor orangeColor];
        _label2.backgroundColor = [UIColor greenColor];
        _label2.numberOfLines = 0;
    }
    return _label2;
}

- (UIImageView *)imView {
    if (!_imView) {
        _imView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imView;
}

@end
