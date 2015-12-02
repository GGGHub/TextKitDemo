//
//  LSYTextStorage.m
//  TextKitDemo
//
//  Created by Labanotation on 15/12/2.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "LSYTextStorage.h"
@interface LSYTextStorage ()
@property (nonatomic,strong) NSMutableAttributedString *attributedString;
@end
@implementation LSYTextStorage
- (instancetype)init
{
    self = [super init];
    if (self) {
        _attributedString = [[NSMutableAttributedString alloc] init];
    }
    return self;
}
-(NSString *)string{
    return [_attributedString string];
}
- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(nullable NSRangePointer)range
{
    return [_attributedString attributesAtIndex:location effectiveRange:range];
}
-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
    [self beginEditing];
    [_attributedString replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedAttributes|NSTextStorageEditedCharacters range:range changeInLength:str.length-range.length];
    [self endEditing];
}
-(void)setAttributes:(NSDictionary<NSString *,id> *)attrs range:(NSRange)range
{
    [self beginEditing];
    [_attributedString setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
    [self endEditing];
}
@end
