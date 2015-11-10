# RCRunkeeperSwitch
A Objective C impltation for Runkeeper design switch control, it is a clone from [DGRunkeeperSwitch](https://github.com/gontovnik/DGRunkeeperSwitch)

![alt tag](https://raw.githubusercontent.com/rcgary/RCRunkeeperSwitch/master/RCRunkeeperSwitch.png)
![alt tag](https://raw.githubusercontent.com/rcgary/RCRunkeeperSwitch/master/RCRunkeeperSwitch.gif)

## Requirements
* iOS 7.0 or higher (May work on previous versions, just did not test it. Feel free to edit it).
* ARC

## Demo

Open and run the `RCRunkeeperSwitchDemo.xcodeproj` in Xcode to see RCRunkeeperSwitch in action.

## Installation
### Cocoapod
```
pod 'RCRunkeeperSwitch'
```
### Manual

All you need to do is drop `RCRunkeeperSwitch.h` and `RCRunkeeperSwitch.m` file into your project

## Example usage

``` objc
RCRunkeeperSwitch *runkeeperSwitch = [[RCRunkeeperSwitch alloc]initWithLeftTitle:@"Feed" rightTitle:@"Leaderboard"];
runkeeperSwitch.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:95.0/255.0 blue:49.0/255.0 alpha:1.0];
runkeeperSwitch.selectedBackgroundColor = [UIColor whiteColor];
runkeeperSwitch.titleColor = [UIColor whiteColor];
runkeeperSwitch.selectedTitleColor = [UIColor colorWithRed:239.0/255.0 green:95.0/255.0 blue:49.0/255.0 alpha:1.0];
runkeeperSwitch.titleFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
runkeeperSwitch.frame = CGRectMake(50, 20, CGRectGetWidth(self.view.bounds) - 100, 30);
runkeeperSwitch.autoresizingMask = UIViewAutoresizingFlexibleWidth;
[self.view addSubview:runkeeperSwitch];
```

## Contribution

You are welcome to fork and submit pull requests!
