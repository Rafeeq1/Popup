//
//  REPopOverView.h
//  PopOver
//
//  Created by Rafeeq on 03/11/15.
//  Copyright © 2015 Eeshana. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol REPDelegate <NSObject>

-(void)selectedValueFromPopOver:(NSString*)string;

@end



@interface REPopOverView : UIView

@property(nonatomic,weak)id<REPDelegate>REPDelegate;



-(void)viewsetupWithHeight:(CGFloat)viewHeight withData:(NSArray*)data withImages:(NSArray*)images withTitle:(NSString*)title;

@end
