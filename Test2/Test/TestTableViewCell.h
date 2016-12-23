//
//  TestTableViewCell.h
//  Test2
//
//  Created by 张冠清 on 2016/12/4.
//  Copyright © 2016年 张冠清. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic, strong) NSString *txt;
@property (nonatomic, strong) UITextView *txtView;
@property (nonatomic, copy) void (^getHeight)(CGFloat height);
@property (nonatomic, assign) CGFloat height;

@end
