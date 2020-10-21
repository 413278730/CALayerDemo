//
//  ViewController.m
//  CALayerDemo
//
//  Created by anchu on 2020/10/21.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 200, 100);
    layer.contents = (__bridge id)[UIImage imageNamed:@"timg.jpeg"].CGImage;
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    layer.minificationFilter = kCAFilterTrilinear;
    layer.magnificationFilter = kCAFilterTrilinear;
    layer.rasterizationScale = [UIScreen mainScreen].scale;
    layer.shouldRasterize = YES;
    layer.delegate = self;
    [self.view.layer addSublayer:layer];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}

@end
