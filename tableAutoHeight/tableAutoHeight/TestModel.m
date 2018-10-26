//
//  TestModel.m
//  tableAutoHeight
//
//  Created by bfd on 2018/9/13.
//  Copyright © 2018年 GJ. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel
+ (NSArray *)dataList {
    NSMutableArray *dataArray = [NSMutableArray array];
    NSString *string = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    NSString *string1 = @"因为子线程代码执行完毕了，又自动进入到了主线程，执行了子线程中的UI更新的函数栈，这中间的时间非常的短。就让大家误以为分线程可以更新UI。如果子线程一直在运行，则子线程中的UI更新的函数栈 主线程无法获知，即无法更新。OSI模型是一个由国际标准化组织提出的概念模型，试图提供一个使各种计算机和网络在世界范围内实现互联的标准框架。OSI-七层模型介绍";
    
    //生成假数据
    for (int i = 0; i < 100; i++)
    {
        TestModel *model = [[TestModel alloc] init];
        NSInteger index1 = (arc4random()%(string1.length / 20)) * 20;
        model.subTitle = [string1 substringToIndex:MAX(20, index1)];
        
        NSInteger index = (arc4random()%(string.length / 10)) * 10;
        model.title = [string substringToIndex:MAX(10, index)];
        
        [dataArray addObject:model];
    }
    
    return dataArray.copy;
}

@end
