//
//  ViewController.m
//  CGAffineSample
//
//  Created by shadowPriest on 15/5/26.
//  Copyright (c) 2015年 hxx. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"
#import <objc/runtime.h>

@interface ViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *sampleView2;
@property (weak, nonatomic) IBOutlet UIImageView *sampleView;
@end

@implementation ViewController
static char emailAddressKey;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.sampleView2.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionClicked:(id)sender {
//    CGAffineTransformMakeTranslation(50, 0);// x 增加tx,y增加 ty
//    CGAffineTransform t = CGAffineTransformMakeScale(1.5, 1.5);//x 扩大sx,y扩大 sy
//    CGAffineTransform t = CGAffineTransformMakeRotation(M_PI / 180.0 * 30.0);//顺时针旋转 angle弧度
//    CGAffineTransformIsIdentity(self.sampleView.transform);//是否是单位CGAffineTransform
//    self.sampleView.transform = CGAffineTransformTranslate(self.sampleView.transform,50,0);//返回t x增加tx,y增加ty后的transform
//    self.sampleView.transform = CGAffineTransformScale(self.sampleView.transform, 1.5, 1.5);//返回t xs扩大sx,y扩大sy后的transform
//    self.sampleView.transform = CGAffineTransformRotate(self.sampleView.transform, M_PI/180.0*30.0);//返回 t旋转 angle弧度后的transform
    
//    CGAffineTransform t = CGAffineTransformMakeScale(1.5, 1.5);
//    self.sampleView.transform = CGAffineTransformInvert(t);//反转t(原来是扩大就缩小，顺时针转就逆时针转
    
//    CGAffineTransform t1 = CGAffineTransformMakeTranslation(50, 0);
//    CGAffineTransform t2 = CGAffineTransformMakeScale(1.5, 1.0);
//    self.sampleView.transform = CGAffineTransformConcat(t1, t2);//先做t1变换再做t2变换
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 300, 300);
    [self.view.layer addSublayer:layer];
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    __block UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGRect frame = layer.frame;
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(frame.origin.x * scale, frame.origin.y * scale, frame.size.width * scale, frame.size.height * scale));
    image = [UIImage imageWithCGImage:imageRef];
    image = [image applyBlurWithRadius:50.0f tintColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1] saturationDeltaFactor:3 maskImage:nil];
    layer.contents = (__bridge id)(image.CGImage);
//    self.sampleView.transform = t;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    objc_setAssociatedObject(alert, &emailAddressKey, @"value", OBJC_ASSOCIATION_COPY_NONATOMIC);
    [alert show];
}
- (IBAction)comClicked:(id)sender {
    __unused CATransform3D t = CATransform3DIdentity;
    self.sampleView2.hidden = YES;
    t.m34 = 0.0005;
    t = CATransform3DRotate(t, M_PI * 30 / 180.0, 0, 0, 0);
    self.sampleView.layer.transform = t;
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"%@",objc_getAssociatedObject(alertView, &emailAddressKey));
}
@end
