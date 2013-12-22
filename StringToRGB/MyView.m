//
//  MyView.m
//  StringToRGB
//
//  Created by Syuuhi on 13-11-15.
//  Copyright (c) 2013年 周飞. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

-(void)btnPress:(id)sender{
    NSAlert *alert=[NSAlert alertWithMessageText:@"请输入十六进制颜色代码！" defaultButton:@"Y" alternateButton:nil otherButton:nil informativeTextWithFormat:@"例：#fe10aa"];
    if ([_inputText.stringValue isEqualToString:@""]) {
        [alert runModal];
        return;
    }
    NSInteger len = _inputText.stringValue.length;
    if(len != 7){
        alert=[NSAlert alertWithMessageText:@"输入的十六进制位数不对，请参照示例重新输入！" defaultButton:@"Y" alternateButton:nil otherButton:nil informativeTextWithFormat:@"例：#fe10aa"];
        [alert runModal];
        return;
    }
    NSString* reg = @"^#[0-9a-fA-F]{6}$";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:_inputText.stringValue options:0 range:NSMakeRange(0, [_inputText.stringValue length])];
    if (!result) {
        alert=[NSAlert alertWithMessageText:@"输字符串中包含有非法字符!请确定是否输入了十六进制之外的字符！" defaultButton:@"Y" alternateButton:nil otherButton:nil informativeTextWithFormat:@"例：#fe10aa"];
        [alert runModal];
        return;
    }
    NSString *hexColor = [_inputText.stringValue substringFromIndex:1];
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    _textR.stringValue = [NSString stringWithFormat:@"%d",red];
    _textG.stringValue = [NSString stringWithFormat:@"%d",green];
    _textB.stringValue = [NSString stringWithFormat:@"%d",blue];
    
    [_color setBackgroundColor:[NSColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:1 ]];
}
@end
