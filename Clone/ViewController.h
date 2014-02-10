//
//  ViewController.h
//  Clone
//
//  Created by Nagarajan on 2/5/14.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;
@end
