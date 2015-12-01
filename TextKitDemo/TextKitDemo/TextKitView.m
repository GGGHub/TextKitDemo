//
//  TextKitView.m
//  TextKitDemo
//
//  Created by okwei on 15/12/1.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "TextKitView.h"
@interface TextKitView ()<NSLayoutManagerDelegate>
@property (nonatomic,strong) NSTextContainer *textContainer;
@property (nonatomic,strong) NSLayoutManager *layoutManager;
@end
@implementation TextKitView

-(void)awakeFromNib
{
    self.textContainer = [[NSTextContainer alloc] init];
    self.layoutManager = [[NSLayoutManager alloc] init];
    self.layoutManager.delegate = self;
    [self.layoutManager addTextContainer:self.textContainer];
    [self.textView.textStorage addLayoutManager:self.layoutManager];
}
- (void)layoutManagerDidInvalidateLayout:(NSLayoutManager *)sender
{
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    NSLayoutManager *layoutManager = self.layoutManager;
    NSRange range = [layoutManager glyphRangeForTextContainer:self.textContainer];;
    [layoutManager drawGlyphsForGlyphRange:range atPoint:CGPointMake(10, 10)];
}
-(void)layoutSubviews
{
    self.textContainer.size = self.frame.size;
}

@end
