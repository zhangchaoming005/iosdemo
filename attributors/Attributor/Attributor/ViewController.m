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
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    
    [title setAttributes:@{NSStrokeWidthAttributeName : @5,
                           NSStrokeColorAttributeName : self.outlineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   // [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)preferredFontsChanged:(NSNotification *) notification {
    [self usePreferredFonts];
}

-(void)usePreferredFonts {
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}
- (IBAction)changeBodySelectionBackgroundColor:(id)sender {
    if ([sender respondsToSelector:@selector(backgroundColor)]) {
        [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:[sender backgroundColor] range:[self.body selectedRange]];
    }

}
- (IBAction)outlineBodySelection:(id)sender {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @10,
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
