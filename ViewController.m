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
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.contents = (__bridge id)[UIImage imageNamed:@"timg.jpeg"].CGImage;
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    layer.minificationFilter = kCAFilterTrilinear;
    layer.magnificationFilter = kCAFilterTrilinear;
    layer.rasterizationScale = [UIScreen mainScreen].scale;
    layer.shouldRasterize = YES;
    [self.view.layer addSublayer:layer];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(100, 250, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:blueLayer];
    [blueLayer display];

}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
