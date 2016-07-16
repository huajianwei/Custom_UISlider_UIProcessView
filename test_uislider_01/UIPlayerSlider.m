//
//  UIPlayerSlider.m
//  test_uislider_01
//
//  Created by jeffasd on 16/7/15.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "UIPlayerSlider.h"

@implementation UIPlayerSlider

- (CGRect)trackRectForBounds:(CGRect)bounds{
    
    return CGRectMake(0, self.frame.size.height/2.0 - 10/2.0, self.frame.size.width, 10);
}

@end
