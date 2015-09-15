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

## License

The MIT License (MIT)

Copyright (c) 2015 Danil Gontovnik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
