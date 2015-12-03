//
//  ViewController.m
//  TextKitDemo
//
//  Created by okwei on 15/12/1.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "ViewController.h"
#import "LSYTextStorage.h"
@interface ViewController ()
{
    LSYTextStorage *textStroage;
}
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = _textView.text;
    textStroage = [[LSYTextStorage alloc] init];
    [textStroage replaceCharactersInRange:NSMakeRange(0, 0) withString:str];
    [textStroage addLayoutManager:self.textView.layoutManager];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
