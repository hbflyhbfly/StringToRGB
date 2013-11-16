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
    NSAlert *alert=[NSAlert alertWithMessageText:@"Information" defaultButton:@"Y" alternateButton:@"N" otherButton:nil informativeTextWithFormat:@"Nothing"];
    if ([_inputText.stringValue isEqualToString:@""]) {
        
        [alert beginSheetModalForWindow:self.window modalDelegate:nil didEndSelector:nil contextInfo:@"请输入十六进制颜色！"];
        
    }
    NSInteger len = _inputText.stringValue.length;
    if(len != 7){
        [alert beginSheetModalForWindow:self.window modalDelegate:nil didEndSelector:nil contextInfo:@"输入的十六进制位数不对，请参照示例重新输入！"];
    }
    NSString* reg = @"^#[0-9a-fA-F]{6}$";

    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:_inputText.stringValue options:0 range:NSMakeRange(0, [_inputText.stringValue length])];
    if (!result) {
        [alert beginSheetModalForWindow:self.window modalDelegate:nil didEndSelector:nil contextInfo:@"输字符串中包含有非法字符!请确定是否输入了十六进制之外的字符"];
    }
}
@end
