//
//  RCRunkeeperSwitch.m
//  RCRunkeeperSwitchDemo
//
//  Created by Chao Ruan on 15/09/2015.
//  Copyright (c) 2015 Chao Ruan. All rights reserved.
//

#import "RCRunkeeperSwitch.h"
#import <objc/runtime.h>

@interface RCRunkeeperSwitchRoundedLayer :CALayer
@end

@implementation RCRunkeeperSwitchRoundedLayer

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.cornerRadius = self.bounds.size.height / 2.0;
}

@end

@interface RCRunkeeperSwitch ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIView *titleLabelsContentView;
@property (nonatomic, strong)UILabel *leftTitleLabel;
@property (nonatomic, strong)UILabel *rightTitleLabel;

@property (nonatomic, strong)UIView *selectedTitleLabelsContentView;
@property (nonatomic, strong)UILabel *selectedRightTitleLabel;
@property (nonatomic, strong)UILabel *selectedLeftTitleLabel;

@property (nonatomic, strong)UIView *selectedBackgroundView;

@property (nonatomic, strong)UIView *titleMaskView;

@property (nonatomic, strong)UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong)UIPanGestureRecognizer *panGesture;

@property (nonatomic, assign)CGRect initialSelectedBackgroundViewFrame;
@property (nonatomic, assign)NSInteger selectedIndex;
@end

static NSString *SelectedBackgroundViewFrameKeyPath = @"selectedBackgroundView.frame";

@implementation RCRunkeeperSwitch

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self finishInit];
    }
    return self;
}

- (instancetype)initWithLeftTitle:(NSString*)leftTtitle rightTitle:(NSString*)rightTitle
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self finishInit];
        self.leftTitle = leftTtitle;
        self.rightTitle = rightTitle;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self finishInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self finishInit];
    }
    return self;
}

- (void)finishInit
{
    self.selectedIndex = 0;
    self.selectedBackgroundInset = 2.0;
    self.animationDuration = 0.3;
    self.animationSpringDamping = 0.75;
    self.animationInitialSpringVelocity = 0.0;
    self.titleLabelsContentView = [[UIView alloc] init];
    self.leftTitleLabel = [[UILabel alloc] init];
    self.rightTitleLabel = [[UILabel alloc] init];
    
    self.selectedTitleLabelsContentView = [[UIView alloc] init];
    self.selectedLeftTitleLabel = [[UILabel alloc] init];
    self.selectedRightTitleLabel = [[UILabel alloc] init];
    
    self.selectedBackgroundView = [[UIView alloc] init];
    self.titleMaskView = [[UIView alloc] init];
    
    [self.titleLabelsContentView addSubview:self.leftTitleLabel];
    [self.titleLabelsContentView addSubview:self.rightTitleLabel];
    [self addSubview:self.titleLabelsContentView];
    
    object_setClass(self.selectedBackgroundView.layer, RCRunkeeperSwitchRoundedLayer.class);
    [self addSubview:self.selectedBackgroundView];
    
    [self.selectedTitleLabelsContentView addSubview:self.selectedLeftTitleLabel];
    [self.selectedTitleLabelsContentView addSubview:self.selectedRightTitleLabel];
    [self addSubview:self.selectedTitleLabelsContentView];
    self.leftTitleLabel.textAlignment = self.rightTitleLabel.textAlignment = self.selectedLeftTitleLabel.textAlignment = self.selectedRightTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    object_setClass(self.titleMaskView.layer, RCRunkeeperSwitchRoundedLayer.class);
    self.titleMaskView.backgroundColor = [UIColor blackColor];
    self.selectedTitleLabelsContentView.layer.mask = self.titleMaskView.layer;
    
    self.backgroundColor = [UIColor blackColor];
    self.selectedBackgroundColor = [UIColor whiteColor];
    self.titleColor = [UIColor whiteColor];
    self.titleColor = [UIColor whiteColor];
    self.selectedTitleColor = [UIColor blackColor];
    
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:self.tapGesture];
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    self.panGesture.delegate = self;
    [self addGestureRecognizer:self.panGesture];
    [self addObserver:self forKeyPath:SelectedBackgroundViewFrameKeyPath options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:SelectedBackgroundViewFrameKeyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:SelectedBackgroundViewFrameKeyPath]) {
        self.titleMaskView.frame = self.selectedBackgroundView.frame;
    }
}

- (void)tapped:(UITapGestureRecognizer*)gesture
{
    CGPoint location = [gesture locationInView:self];
    NSInteger index = location.x < CGRectGetWidth(self.bounds) / 2.0 ? 0 : 1;
    [self setSelectedIndex:index  animated:YES];
}

- (void)pan:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.initialSelectedBackgroundViewFrame = self.selectedBackgroundView.frame;
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGRect frame = self.initialSelectedBackgroundViewFrame;
        frame.origin.x  += [gesture translationInView:self].x;
        
        frame.origin.x  = MAX(MIN(frame.origin.x, self.bounds.size.width - self.selectedBackgroundInset - frame.size.width), self.selectedBackgroundInset);
        self.selectedBackgroundView.frame = frame;
    } else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) {
        CGFloat velocityX = [gesture velocityInView:self].x;
        if (velocityX > 500.0) {
            [self setSelectedIndex:1 animated:true];
        } else if (velocityX < - 500.0) {
            [self setSelectedIndex:0 animated:true];
        } else if (self.selectedBackgroundView.center.x >= self.bounds.size.width / 2.0) {
            [self setSelectedIndex:1 animated:true];
        }  else if (self.selectedBackgroundView.center.x < self.bounds.size.width / 2.0) {
            [self setSelectedIndex:0 animated:true];
        }
    }
}

+ (Class)layerClass
{
    return [RCRunkeeperSwitchRoundedLayer class];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated
{
    self.selectedIndex = selectedIndex;
    if (animated) {
        [UIView animateWithDuration:self.animationDuration delay:0 usingSpringWithDamping:self.animationSpringDamping initialSpringVelocity:self.animationInitialSpringVelocity options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self layoutSubviews];
        } completion:^(BOOL finished) {
            if (finished) {
                [self sendActionsForControlEvents:UIControlEventValueChanged];
            }
        }];
    } else {
        [self layoutSubviews];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = self.selectedBackgroundInset * 2.0;
    CGFloat selectedBackgroundWidth = CGRectGetWidth(self.bounds) / 2.0 - padding;
    self.selectedBackgroundView.frame = CGRectMake(self.selectedBackgroundInset + self.selectedIndex * (selectedBackgroundWidth + padding), self.selectedBackgroundInset, selectedBackgroundWidth, CGRectGetHeight(self.bounds) - padding);
    self.titleLabelsContentView.frame = self.selectedTitleLabelsContentView.frame = self.bounds;
    CGFloat titleLabelMaxWidth = selectedBackgroundWidth;
    CGFloat titleLabelMaxHeight = CGRectGetHeight(self.bounds) - padding;
    
    CGSize leftTitleLabelSize = [self.leftTitleLabel sizeThatFits:CGSizeMake(titleLabelMaxWidth, titleLabelMaxHeight)];
    CGPoint leftTitleLabelOrigin = CGPointMake(floor((CGRectGetWidth(self.bounds) / 2.0 - leftTitleLabelSize.width) / 2.0), floor(CGRectGetHeight(self.bounds) - leftTitleLabelSize.height) / 2.0);
    CGRect leftTitleLabelFrame = CGRectMake(leftTitleLabelOrigin.x, leftTitleLabelOrigin.y, leftTitleLabelSize.width, leftTitleLabelSize.height);
    self.leftTitleLabel.frame = self.selectedLeftTitleLabel.frame = leftTitleLabelFrame;
    
    CGSize rightTitleLabelSize = [self.rightTitleLabel sizeThatFits:CGSizeMake(titleLabelMaxWidth, titleLabelMaxHeight)];
    CGPoint rightTitleLabelOrigin = CGPointMake(floor(CGRectGetWidth(self.bounds) / 2.0 + (CGRectGetWidth(self.bounds) / 2.0 - rightTitleLabelSize.width) / 2.0), floor(CGRectGetHeight(self.bounds) - rightTitleLabelSize.height) / 2.0);
    CGRect rightTitleLabelFrame = CGRectMake(rightTitleLabelOrigin.x, rightTitleLabelOrigin.y, rightTitleLabelSize.width, rightTitleLabelSize.height);
    self.rightTitleLabel.frame = self.selectedRightTitleLabel.frame = rightTitleLabelFrame;
}
#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.panGesture) {
        return CGRectContainsPoint(self.selectedBackgroundView.frame, [gestureRecognizer locationInView:self]);
    }
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

#pragma mark - Setters
- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    self.leftTitleLabel.text = leftTitle;
    self.selectedLeftTitleLabel.text = leftTitle;
}

- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    self.rightTitleLabel.text = rightTitle;
    self.selectedRightTitleLabel.text = rightTitle;
}

- (void)setSelectedBackgroundInset:(CGFloat)selectedBackgroundInset
{
    _selectedBackgroundInset = selectedBackgroundInset;
    [self setNeedsLayout];
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    _selectedBackgroundColor = selectedBackgroundColor;
    self.selectedBackgroundView.backgroundColor = selectedBackgroundColor;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.leftTitleLabel.textColor = titleColor;
    self.rightTitleLabel.textColor = titleColor;
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor
{
    _selectedTitleColor = selectedTitleColor;
    self.selectedLeftTitleLabel.textColor = selectedTitleColor;
    self.selectedRightTitleLabel.textColor = selectedTitleColor;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.leftTitleLabel.font = titleFont;
    self.rightTitleLabel.font = titleFont;
    self.selectedLeftTitleLabel.font = titleFont;
    self.selectedRightTitleLabel.font = titleFont;
}
@end
