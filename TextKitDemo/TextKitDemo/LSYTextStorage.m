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
-(void)processEditing
{
    
    NSRange lineRange = NSUnionRange(self.editedRange, [self.string lineRangeForRange:self.editedRange]);
    [self.attributedString.string enumerateSubstringsInRange:lineRange options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        NSLog(@"%@",substring);
        if ([substring isEqualToString:@"GGGHub"]) {
            [self setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:substringRange];
        }
        else{
            [self setAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} range:substringRange];
        }
    }];
    [super processEditing];
    
}
@end
