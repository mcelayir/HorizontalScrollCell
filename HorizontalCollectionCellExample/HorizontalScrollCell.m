//
//  HorizontalScrollCell.m
//  MoviePicker
//
//  Created by Muratcan Celayir on 28.01.2015.
//  Copyright (c) 2015 Muratcan Celayir. All rights reserved.
//

#import "HorizontalScrollCell.h"


@implementation HorizontalScrollCell

- (void)awakeFromNib {
    // Initialization code
 
}

//-(void)willMoveToSuperview:(UIView *)newSuperview
//{
//    supW = newSuperview.frame.size.width;
//    NSLog(@"%.2f",supW);
//    
//    diff = self.frame.size.width;
//    NSLog(@"%.2f",diff);
//    
//    off = (supW - diff);
//    
//    //[self.scroll setFrame:CGRectMake(self.scroll.frame.origin.x, self.scroll.frame.origin.y, self.frame.size.width + off, 164)];
//    
//}

//-(void)didMoveToSuperview
//{
//    
//    
//    NSLog(@"%.2f", self.scroll.frame.size.width);
//    
//    [super didMoveToSuperview];
//    
//    //[self.scroll setFrame:CGRectMake(self.scroll.frame.origin.x, self.scroll.frame.origin.y, self.frame.size.width, 164)];
//}

//-(void)layoutIfNeeded
//{
//    [super layoutIfNeeded];
//    
//    diff = self.frame.size.width;
//    NSLog(@"%.2f",diff);
//    
//    off = (supW - diff);
//    
//    [self layoutSubviews];
//}


-(void)layoutSubviews
{
    NSLog(@"%.2f", self.scroll.frame.size.width);
    
    //[self.scroll setFrame:CGRectMake(self.scroll.frame.origin.x, self.scroll.frame.origin.y, self.frame.size.width + off, 164)];
    
    NSLog(@"%.2f", self.scroll.frame.size.width);
}

-(void)setUpCellWithArray:(NSArray *)array
{
    CGFloat xbase = 10;
    CGFloat width = 100;
    
    [self.scroll setScrollEnabled:YES];
    [self.scroll setShowsHorizontalScrollIndicator:NO];
    
    for(int i = 0; i < [array count]; i++)
    {
        UIImage *image = [array objectAtIndex:i];
        UIView *custom = [self createCustomViewWithImage: image];
        [self.scroll addSubview:custom];
        [custom setFrame:CGRectMake(xbase, 7, width, 150)];
        xbase += 10 + width;
        
        
    }
    
    [self.scroll setContentSize:CGSizeMake(xbase, self.scroll.frame.size.height)];
}

-(UIView *)createCustomViewWithImage:(UIImage *)image
{
    UIView *custom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 150)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 150)];
    [imageView setImage:image];
    
    [custom addSubview:imageView];
    [custom setBackgroundColor:[UIColor whiteColor]];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [custom addGestureRecognizer:singleFingerTap];
    
    return custom;
}



//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"clicked");
    
    UIView *selectedView = (UIView *)recognizer.view;
    
    if([_cellDelegate respondsToSelector:@selector(cellSelected)])
        [_cellDelegate cellSelected];
    
    //Do stuff here...
}

@end
