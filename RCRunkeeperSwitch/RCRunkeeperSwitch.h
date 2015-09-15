//
//  RCRunkeeperSwitch.h
//  RCRunkeeperSwitchDemo
//
//  Created by Chao Ruan on 15/09/2015.
//  Copyright (c) 2015 Chao Ruan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRunkeeperSwitch : UIControl
@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *rightTitle;
@property (nonatomic, assign) CGFloat selectedBackgroundInset;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, assign) CGFloat animationSpringDamping;
@property (nonatomic, assign) CGFloat animationInitialSpringVelocity;

- (instancetype)initWithLeftTitle:(NSString*)leftTtitle rightTitle:(NSString*)rightTitle;
@end
