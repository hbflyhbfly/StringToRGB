//
//  MyView.h
//  StringToRGB
//
//  Created by Syuuhi on 13-11-15.
//  Copyright (c) 2013年 周飞. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyView : NSView
@property IBOutlet NSTextField *inputText;
@property IBOutlet NSButton *button;
@property IBOutlet NSTextField *textR;
@property IBOutlet NSTextField *textG;
@property IBOutlet NSTextField *textB;
-(IBAction)btnPress:(id)sender;
@end