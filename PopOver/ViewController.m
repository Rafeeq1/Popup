//
//  ViewController.m
//  PopOver
//
//  Created by Rafeeq on 03/11/15.
//  Copyright © 2015 Eeshana. All rights reserved.
//

#import "ViewController.h"
#import "REPopOverView.h"


@interface ViewController ()<REPDelegate>
{
    UIView *repBGView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showPopView:(UIButton*)sender
{
    NSArray *data=[[NSArray alloc] initWithObjects:@"Facebook",@"Twitter",@"Instagram",@"Linkedin", nil];
    
    repBGView=[[UIView alloc] initWithFrame:self.view.frame];
    
    repBGView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    repBGView.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        repBGView.alpha = 1;
        repBGView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    repBGView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.6];
    
    REPopOverView *repView =
    [[[NSBundle mainBundle] loadNibNamed:@"REPopOverView"
                                   owner:self
                                 options:nil]
     objectAtIndex:0];

    repView.center=self.view.center;
    repView.REPDelegate=self;
    
    [repView viewsetupWithHeight:250 withData:data withImages:nil withTitle:@"Share with"];
    
    [repBGView addSubview:repView];
    [self.view addSubview:repBGView];
    
}


#pragma mark -
#pragma mark -repDelegate


-(void)selectedValueFromPopOver:(NSString*)string
{
    NSLog(@"selected value: %@",string);
    [self removePopOverBG];
}

-(void)removePopOverBG
{
    [UIView animateWithDuration:.60 animations:^{
        repBGView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        repBGView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [repBGView removeFromSuperview];
        }
    }];
}

@end
