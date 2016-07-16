//
//  ViewController.m
//  test_uislider_01
//
//  Created by cdd on 16/6/22.
//  Copyright © 2016年 cdd. All rights reserved.
//

#import "ViewController.h"
#import "UIPlayerSlider.h"

@interface ViewController ()

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPlayerSlider *slider = [[UIPlayerSlider alloc] initWithFrame:CGRectMake(20, 200, 300, 44)];
    
//    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 200, 300, 44)];
    
    //git test
    
    slider.backgroundColor = [UIColor orangeColor];
    
    [slider setMinimumTrackTintColor:[UIColor redColor]];
    
    [slider setMinimumValueImage:[self ImageWithColor:[UIColor redColor]]];
    
//    [slider setMinimumTrackImage:[self ImageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal];
    
    [self.view addSubview:slider];
    
    [slider setTintColor:[UIColor cyanColor]];
    
    
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];//这里是设定progressView的模式为默认模式
    self.progressView.frame = CGRectMake(20, 200 + 90, 300, 0);
    
//    self.progressView.progressTintColor=[UIColor cyanColor];//设定progressView的显示颜色
    
    self.progressView.progressImage = [self ImageWithColor:[UIColor redColor]];
    
//    self.progressView.progressImage = [self createRoundImage:2 UIColor:[UIColor redColor]];
    
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 10.0f);
    self.progressView.transform = transform;//设定宽高
//    self.progressView.trackImage = image4;
    self.progressView.contentMode = UIViewContentModeScaleAspectFill;
    //设定两端弧度
    
    _progressView.backgroundColor = [UIColor yellowColor];
    
    [_progressView setTrackTintColor:[UIColor cyanColor]];
    
//    self.progressView.layer.cornerRadius = 1.0;
//    self.progressView.layer.masksToBounds = YES;
    //设定progressView的现实进度（一般情况下可以从后台获取到这个数字）
    [self.progressView setProgress:1.0 animated:YES];
    [self.view addSubview:self.progressView];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 3)];
//    
//    
//    
//    _progressView.layer.shadowColor = [UIColor yellowColor].CGColor;//shadowColor阴影颜色
//    _progressView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
//    _progressView.layer.shadowOpacity = 1;//阴影透明度，默认0
//    _progressView.layer.shadowRadius = 3;//阴影半径，默认3
//
////    _imageView1.layer.shadowColor = [UIColor yellowColor].CGColor;//shadowColor阴影颜色
////    _imageView1.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
////    _imageView1.layer.shadowOpacity = 1;//阴影透明度，默认0
////    _imageView1.layer.shadowRadius = 3;//阴影半径，默认3
//    
//    _progressView.layer.shadowPath = path.CGPath;
    
    
//    _progressView.layer.shadowColor = [UIColor redColor].CGColor;//shadowColor阴影颜色
//    _progressView.layer.shadowOffset = CGSizeMake(4,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    _progressView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
//    _progressView.layer.shadowRadius = 4;//阴影半径，默认3
    
//    imageView.layer.shadowColor = [UIColor blueColor].CGColor;//阴影颜色
//        imageView.layer.shadowOffset = CGSizeMake(4, 4);//偏移距离
//        imageView.layer.shadowOpacity = 0.5;//不透明度
//        imageView.layer.shadowRadius = 2.0;//半径
    
#if 0
         //1.创建自定义的layer
         CALayer *layer=[CALayer layer];
         //2.设置layer的属性
//         layer.backgroundColor=[UIColor clearColor].CGColor;
    layer.frame = _progressView.bounds;
//         layer.anchorPoint=CGPointZero;
//         layer.position=CGPointMake(100, 100);
//         layer.cornerRadius=20;
         layer.shadowColor=[UIColor redColor].CGColor;
         layer.shadowOffset=CGSizeMake(0, 0);
            layer.shadowRadius = 3;
         layer.shadowOpacity=1;
    
         //设置代理
//         layer.delegate=self;
         [layer setNeedsDisplay];
         //3.添加layer
         [_progressView.layer addSublayer:layer];
    
#endif
    
//    [self travelSubviews:_progressView];
    
//    [self dropShadowWithOffset:CGSizeMake(0, 1)radius:0
//                                                            color:[UIColor darkGrayColor]
//                                                          opacity:0.1];
    
    
    
}

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, _progressView.bounds);
    _progressView.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    _progressView.layer.shadowColor = color.CGColor;
    _progressView.layer.shadowOffset = offset;
    _progressView.layer.shadowRadius = radius;
    _progressView.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
//    _progressView.clipsToBounds = NO;
    
}

- (UIImage *)createRoundImage:(CGFloat)width UIColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, width), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, width, width));
    
    CGContextRestoreGState(context);
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(width/4, width/4, width/2, width/2));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, width), NO, 0.0);
    
    //裁剪图片
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //    CGContextRestoreGState(context);
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, width, width));
    CGContextClip(ctx);
    //    [image drawAtPoint:CGPointMake(0, 0)];
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, width), image.CGImage);
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newimage;
    
}

-(void)travelSubviews:(UIView *)subView
{
    if (subView.subviews.count>0) {
        for (UIView *subViews in subView.subviews) {
            
            NSLog(@"the subView.subView is %@", subViews);
            
            [self travelSubviews:subViews];
        }
    }
    else
    {
        NSLog(@"the count is %lu",(unsigned long)subView.subviews.count);
        
//        [subView removeFromSuperview];
        
    }  
}

- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    
}

- (UIImage *)ImageWithColor:(UIColor *)color{
    
    CGSize size = CGSizeMake(200, 25);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    
//    CGContextFillRect(context, CGRectMake(0, 0, 2, 2));
    
    
    UIBezierPath *singleLinePath = [[UIBezierPath alloc] init];
    float width = size.width;
    float height = size.height;
    width = size.width * 1;
    //    height = 30;
    float start = 0.0;
    [singleLinePath moveToPoint:CGPointMake(start, start)];
    [singleLinePath addLineToPoint:CGPointMake(width+start-height/2, 0+start)];
    [singleLinePath addArcWithCenter:CGPointMake(width+start-height/2, height/2+start) radius:height/2 startAngle:-M_PI/2 endAngle:M_PI/2 clockwise:YES];
    [singleLinePath addLineToPoint:CGPointMake(start, height+start)];
    [singleLinePath addLineToPoint:CGPointMake(start, start)];
//    _shapeLayer.path = singleLinePath.CGPath;
    
    
    CGContextAddPath(context, singleLinePath.CGPath);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillPath(context);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGFloat top = 25; // 顶端盖高度
    CGFloat bottom = 25 ; // 底端盖高度
    CGFloat left = 0; // 左端盖宽度
    CGFloat right = 200-1; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    return image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
