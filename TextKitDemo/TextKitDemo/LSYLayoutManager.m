//
//  LSYLayoutManager.m
//  TextKitDemo
//
//  Created by okwei on 15/12/3.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "LSYLayoutManager.h"

@implementation LSYLayoutManager
-(void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin
{
    [super drawBackgroundForGlyphRange:glyphsToShow atPoint:origin];
}
-(void)drawGlyphsForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin
{
    
    NSRange range = [self characterRangeForGlyphRange:glyphsToShow
                                     actualGlyphRange:NULL];
    [self.textStorage enumerateAttribute:@"LSYSecretAttribute" inRange:range options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        //找到在LSYTextStorage中自定的LSYSecretAttribute属性
        if ([value isEqualToString:@"secretAttribute"]) {
            NSRange glyphRange = [self glyphRangeForCharacterRange:range
                                              actualCharacterRange:NULL];
            NSTextContainer *
            container = [self textContainerForGlyphAtIndex:glyphRange.location
                                            effectiveRange:NULL];
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);   //保存当前的绘图配置信息
            CGContextTranslateCTM(context, origin.x, origin.y); //转换初始坐标系到绘制字形的位置
            [[UIColor blackColor] setFill];
            CGRect rect = [self boundingRectForGlyphRange:glyphRange inTextContainer:container];
            [self drawSecret:rect]; //开始绘制
             CGContextRestoreGState(context); //恢复绘图配置信息
        }
        else
        {
            [super drawGlyphsForGlyphRange:range atPoint:origin];
        }
        
    }];
    
}
/*(CGRect) rect = (origin = (x = 5, y = 69), size = (width = 53.390625, height = 13.799999999999997))
*/
-(void)drawSecret:(CGRect)rect
{
   
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [path fill];
   
}
@end
