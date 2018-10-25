//
//  TestCell.m
//  tableAutoHeight
//
//  Created by bfd on 2018/9/12.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "TestCell.h"
#import "NSMutableAttributedString+quick.h"

#define MAS_SHORTHAND
//#import "Masonry.h"
#import "Masonry/Masonry.h"
@interface TestCell()
//@property (weak, nonatomic) IBOutlet UILabel *label;
//@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIImageView *imView;
@end


@implementation TestCell
static NSString * const ID = @"TestCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
//        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setModel:(TestModel *)model {
    _model = model;
    
    //!!!!:设置行间距对高度计算没啥影响
//    self.label.text  = model.title;
    NSMutableAttributedString *attStr1 = [[NSMutableAttributedString alloc]initWithString:model.title];
    [attStr1 setParagraphStyle:^(NSMutableParagraphStyle *Paragraph) {
        Paragraph.lineSpacing = 10;
    }];
    self.label.attributedText = attStr1;
    
    
//    self.label2.text = model.subTitle;
    NSMutableAttributedString *attStr2 = [[NSMutableAttributedString alloc]initWithString:model.subTitle];
    [attStr2 setParagraphStyle:^(NSMutableParagraphStyle *Paragraph) {
        Paragraph.lineSpacing = 5;
    }];
    self.label2.attributedText = attStr2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imView];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label2];
        
        //TODO:此处设置防止一开始cell默认高度带来的问题
        [self layoutIfNeeded];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
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


//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
