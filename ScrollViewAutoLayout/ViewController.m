//
//  ViewController.m
//  ScrollViewAutoLayout
//
//  Created by Eleven Chen on 15/7/14.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:self options:nil];
    self.contentView = [nibs objectAtIndex:0];
    [self.scrollView addSubview:self.contentView];
    NSLog(@"main height %f", self.view.bounds.size.height);
    NSLog(@"height %f", self.contentView.frame.size.height);
    
    
//    self.scrollView.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.contentView.frame.size.height);
//    [self.view addSubview:self.contentView];
    
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}


- (void) viewDidLayoutSubviews
{

}

- (void) updateViewConstraints
{

    NSLog(@"scrollview height %f", self.scrollView.frame.size.height);
    NSLog(@"height %f", self.contentView.frame.size.height);
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0f
                                                           constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0f
                                                           constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0f
                                                           constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0f
                                                           constant:0]];
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    NSNumber *height = [NSNumber numberWithFloat:self.contentView.bounds.size.height];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[self(==height)]"
                                                                             options:0
                                                                             metrics:@{@"height": height}
                                                                               views:@{@"self": self.contentView}]];
    NSDictionary *views = @{@"contentView": self.contentView};
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView(==width)]|"
                                                                      options:0
                                                                      metrics:@{@"width": [NSNumber numberWithFloat:self.view.bounds.size.width]}
                                                                        views:views]];
    
    [super updateViewConstraints];
}

- (IBAction)action:(UIButton *)sender
{
    NSLog(@"Action");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
