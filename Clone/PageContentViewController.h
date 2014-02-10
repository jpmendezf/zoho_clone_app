//
//  PageContentViewController.h
//  Clone
//
//  Created by Nagarajan on 2/5/14.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
