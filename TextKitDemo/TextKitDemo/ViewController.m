//
//  ViewController.m
//  TextKitDemo
//
//  Created by okwei on 15/12/1.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "ViewController.h"
#import "LSYTextStorage.h"
#import "LSYLayoutManager.h"
@interface ViewController ()
{
    LSYTextStorage *textStroage;
    LSYLayoutManager *layoutManager;
    NSTextContainer *textContainer;
    
}
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic,strong) UITextView *attrTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = _textView.text;
    textStroage = [[LSYTextStorage alloc] init];
    [textStroage replaceCharactersInRange:NSMakeRange(0, 0) withString:str];
    
    layoutManager = [[LSYLayoutManager alloc] init];
    [textStroage addLayoutManager:layoutManager];
    
    textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer];
    
    _attrTextView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:textContainer];
    [self.view addSubview:_attrTextView];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    textContainer.size = self.textView.frame.size;
    _attrTextView.frame = self.textView.frame;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
