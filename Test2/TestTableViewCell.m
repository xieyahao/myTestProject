//
//  TestTableViewCell.m
//  Test2
//
//  Created by 张冠清 on 2016/12/4.
//  Copyright © 2016年 张冠清. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

-(void)setTxt:(NSString *)txt{
    _txt = txt;
    self.txtView.text = txt;
}

-(void)layoutSubviews{
    //这里纯代码的话需要设置坐标和大小，如果使用的是xib就不用做任何处理。xib里的textview设置成根据内容自适应大小，在cell里需要做的只是cell高度的和内容的收集。在control里对table进行刷新就完成了。你写的那个刷新下一个indexpath其实和刷新整个table是一样的效果。但就是刷新整个table和刷新一行之间的性能问题我就不太确定了。我刚测试了一下好像是刷新下一行更耗性能一点。
    if (self.height == 0) {
        self.height = 30;
    }
    self.txtView.frame = CGRectMake(30, 5, self.frame.size.width - 60, self.height);
    [super layoutSubviews];
}

-(UITextView *)txtView{
    if (!_txtView) {
        _txtView = [[UITextView alloc] init];
        _txtView.font = [UIFont systemFontOfSize:15];
        _txtView.delegate = self;
        _txtView.backgroundColor = [UIColor grayColor];
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
    self.height = size.height;
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    self.cellInfo(size.height + 10,@[@"hhuhuihioiehiihenio",@"rtyui"]);
}

@end
