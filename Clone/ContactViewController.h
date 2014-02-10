//
//  ContactViewController.h
//  Clone
//
//  Created by Nagarajan on 2/5/14.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UITextFieldDelegate>
{
    CGRect originalFrame;
    UITextField *nameField;
    UITextField *msgField;
    UITextField *emailField;
    UITextField *subjectField;
}
@property (nonatomic,strong)UITextField *msgField;
@property (nonatomic,strong)UITextField *nameField;
@property (nonatomic,strong)UITextField *emailField;
@property (nonatomic,strong)UITextField *subjectField;

@end
