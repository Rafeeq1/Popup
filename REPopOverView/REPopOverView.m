//
//  REPopOverView.m
//  PopOver
//
//  Created by Rafeeq on 03/11/15.
//  Copyright © 2015 Eeshana. All rights reserved.
//

#import "REPopOverView.h"

@interface REPopOverView ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,weak)IBOutlet UILabel *titleLbl;
@property(nonatomic, strong) UITableView *tbleView;
@property(nonatomic,strong)NSArray *tbleData;

@end

@implementation REPopOverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void) awakeFromNib
{
    [super awakeFromNib];
}

-(void)viewsetupWithHeight:(CGFloat)viewHeight withData:(NSArray*)data withImages:(NSArray*)images withTitle:(NSString*)title;
{
   
    
    self.titleLbl.text=title;
    
    self.tbleData=[[NSArray alloc] initWithArray:data];

    
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, viewHeight);
    self.tbleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, viewHeight-30)];
    
    self.tbleView.delegate = self;
    self.tbleView.dataSource = self;
    self.tbleView.layer.cornerRadius = 5;
    self.tbleView.showsVerticalScrollIndicator=NO;
    
    if ([self.tbleView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tbleView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tbleView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tbleView setLayoutMargins:UIEdgeInsetsZero];
    }
    
   
   
    [self addSubview:self.tbleView];
    self.tbleView.tableFooterView = [UIView new];
 
}



#pragma mark -
#pragma mark tableview

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tbleData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font=[UIFont boldSystemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.textColor = [UIColor blackColor];

    }
   
    cell.textLabel.text =[self.tbleData objectAtIndex:indexPath.row];
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 30);
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:183.0/255.0 green:181.0/255.0 blue:252.0/255.0 alpha:1];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    [self.REPDelegate selectedValueFromPopOver:[self.tbleData objectAtIndex:indexPath.row]];
}

@end
