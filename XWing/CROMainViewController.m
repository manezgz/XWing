//
//  CROMainViewController.m
//  XWing
//
//  Created by Jose Manuel Franco on 11/4/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

#import "CROMainViewController.h"
@import CoreGraphics;

@interface CROMainViewController ()

@end

@implementation CROMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Creamos un detector de TAP
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap:)];
    
    //Creamos un detector de Swipe
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipe:)];
    
    //Lo añadimos
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swipe];
}

-(void)didTap:(UITapGestureRecognizer *) tap{
    
    //self.xWingView.center =[tap locationInView:self.spaceView];
    
    UIViewAnimationOptions options =UIViewAnimationOptionBeginFromCurrentState |UIViewAnimationOptionCurveEaseIn;
    
    //Traslacion
    
    [UIView animateKeyframesWithDuration:0.8
                                   delay:0
                                 options:0
                              animations:^{
                                //Estado Final
                                  self.xWingView.center=[tap locationInView:self.spaceView];
                              } completion:^(BOOL finished) {
                                  //No hacemos nada
                              }];
    
   //Rotacion
    [UIView animateWithDuration:0.3
                          delay:0
                        options:options
                     animations:^{
                         self.xWingView.transform =CGAffineTransformMakeRotation(M_2_PI);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:options
                                          animations:^{
                                              self.xWingView.transform=CGAffineTransformIdentity;
                                          } completion:^(BOOL finished) {
                                              //
                                          }];
                     }];
}

-(void)didSwipe:(UISwipeGestureRecognizer *) swipe{
    
    UIViewAnimationOptions options =UIViewAnimationOptionBeginFromCurrentState |UIViewAnimationOptionCurveEaseIn;
    //Calculamos el ancho y largo de la pantalla
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //Calculamos un numero aleatoria entre 40 y el tope de altura para altura
    int randomHeigth=arc4random_uniform(screenHeight-20)+20;
    
    //Calculamos un numero aleatorio entre 40 y el ancho para el ancho
    int randomWidth=arc4random_uniform(screenWidth-20)+20;
    
    [UIView animateWithDuration:0.3
                          delay:1
                        options:options
                     animations:^{
                         self.xWingView.alpha=0;
                     } completion:^(BOOL finished) {
                         CGPoint point=CGPointMake(randomWidth,randomHeigth);
                         self.xWingView.center=point;
                         //self.xWingView.center=[CGPoint CGPointMake(arc4random_uniform(screenWidth),arc4random_uniform(screenHeight))];
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:options
                                          animations:^{
                                              self.xWingView.alpha=1;
                                          } completion:^(BOOL finished) {
                                              //
                                          }];
                     }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
