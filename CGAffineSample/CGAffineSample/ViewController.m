//
//  ViewController.m
//  CGAffineSample
//
//  Created by shadowPriest on 15/5/26.
//  Copyright (c) 2015年 hxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *sampleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
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
    
    
    
//    self.sampleView.transform = t;
}

@end
