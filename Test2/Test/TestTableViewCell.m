//
//  TestTableViewCell.m
//  Test2
//
//  Created by 张冠清 on 2016/12/4.
//  Copyright © 2016年 张冠清. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

-(instancetype)init{
    if (self = [super init]) {
        _height = 30;
    }
    return self;
}

-(void)setTxt:(NSString *)txt{
    _txt = txt;
    self.txtView.text = txt;
}

-(void)layoutSubviews{
    self.txtView.frame = CGRectMake(12, 0, self.frame.size.width - 24, 24);
    [super layoutSubviews];
}

-(UITextView *)txtView{
    if (!_txtView) {
        _txtView = [[UITextView alloc] init];
        _txtView.font = [UIFont systemFontOfSize:15];
        _txtView.delegate = self;
        _txtView.backgroundColor = [UIColor grayColor];
        _txtView.layer.cornerRadius = 5.0f;
        _txtView.layer.borderColor = [UIColor redColor].CGColor;
        _txtView.layer.borderWidth = 1.0f;
        [self.contentView addSubview:_txtView];
    }
    return _txtView;
}

-(void)textViewDidChange:(UITextView *)textView{
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height > frame.size.height) {
        textView.scrollEnabled = NO;
    }
    self.getHeight(20);
    self.height = size.height + 4;
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height + 4);
}

@end
