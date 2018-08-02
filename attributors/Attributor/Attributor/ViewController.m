//
//  ViewController.m
//  Attributor
//
//  Created by zhangchaoming on 2018/8/1.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeBodySelectionBackgroundColor:(id)sender {
    if ([sender respondsToSelector:@selector(backgroundColor)]) {
        [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:[sender backgroundColor] range:[self.body selectedRange]];
    }

}
- (IBAction)outlineBodySelection:(id)sender {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName : [UIColor cyanColor]
                                           } range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection:(id)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
