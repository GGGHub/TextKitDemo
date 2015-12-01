//
//  ViewController.m
//  TextKitDemo
//
//  Created by okwei on 15/12/1.
//  Copyright © 2015年 okwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 addArcWithCenter:CGPointMake(50 ,50)
                    radius:20
                startAngle:0
                  endAngle:M_PI*2
                 clockwise:NO];
    [path1 closePath];

    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 addArcWithCenter:CGPointMake(100 ,100)
                     radius:20
                 startAngle:0
                   endAngle:M_PI*2
                  clockwise:NO];
    [path2 closePath];
    self.textView.textContainer.exclusionPaths = @[path1,path2];
    // Do any additional setup after loading the view, typically from a nib.
}
@end
