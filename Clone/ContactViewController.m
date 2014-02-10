//
//  ContactViewController.m
//  Clone
//
//  Created by Nagarajan on 2/5/14.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import "ContactViewController.h"
#import "ViewController.h"
#define subTextFieldTag 123
#define msgTextFieldTag 198

#define IS_RETINA_3_5 ([UIScreen mainScreen].bounds.size.height == 480.0)
#define IS_RETINA_4 ([UIScreen mainScreen].bounds.size.height == 568.0)

@interface ContactViewController ()

@end

@implementation ContactViewController
{
    NSMutableArray *textFieldArray;
    id activeField;
}
@synthesize msgField,subjectField,nameField,emailField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *toolbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    toolbarView.backgroundColor = [UIColor redColor];
    [self.view addSubview:toolbarView];
    
    UILabel * contactlabel = [[UILabel alloc]initWithFrame:CGRectMake(120,25,120,25)];
    contactlabel.text = @"Contact Us";
    contactlabel.textColor = [UIColor blackColor];
    [toolbarView addSubview:contactlabel];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 320, 480)];
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    CGSize bikeScrollViewContentSize = CGSizeMake(320,600);
    [scrollView setContentSize:bikeScrollViewContentSize];


    
    NSArray *lblArr = [[NSArray alloc]initWithObjects:@"Name",@"Email",@"Subject",@"Message", nil];
    float labelX = 10;
    float labelY = 0;
    float labelWidth = 80;
    float labelHeight = 45;
    
    for(int i=0;i<[lblArr count];i++)
    {
        UILabel * firstlabel = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
        firstlabel.text = [lblArr objectAtIndex:i];
        firstlabel.textColor = [UIColor redColor];
        [scrollView addSubview:firstlabel];
        labelY = labelY+70;
    }
    
    if (nameField == nil) {
        nameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 35, 280, 25)];
    }
    nameField.textColor = [UIColor blackColor];
    nameField.delegate=self;
    nameField.returnKeyType = UIReturnKeyNext;
    [nameField setBorderStyle:UITextBorderStyleLine];
    nameField.font = [UIFont fontWithName:@"TimesNewRoman" size:12.0f];
   [scrollView addSubview:nameField];
    
    if (emailField == nil) {
        emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 105, 280, 25)];
    }
    emailField.textColor = [UIColor blackColor];
    emailField.delegate =self;
    emailField.returnKeyType = UIReturnKeyNext;
    [emailField setBorderStyle:UITextBorderStyleLine];
    emailField.font = [UIFont fontWithName:@"TimesNewRoman" size:12.0f];
    [scrollView addSubview:emailField];
    
    if (subjectField == nil) {
    subjectField = [[UITextField alloc]initWithFrame:CGRectMake(20, 175, 280, 25)];
    }
    subjectField.textColor = [UIColor blackColor];
    [subjectField setBorderStyle:UITextBorderStyleLine];
    subjectField.tag = subTextFieldTag;
    subjectField.delegate = self;
    subjectField.returnKeyType = UIReturnKeyNext;
    subjectField.font = [UIFont fontWithName:@"TimesNewRoman" size:12.0f];
    [scrollView addSubview:subjectField];
    
    if (msgField == nil) {
        if (IS_RETINA_3_5) {
            msgField= [[UITextField alloc]initWithFrame:CGRectMake(20, 245, 280, 105)];
        }
        else {
            msgField = [[UITextField alloc]initWithFrame:CGRectMake(20, 245, 280, 135)];
        }
    }
    msgField.textColor = [UIColor blackColor];
    msgField.tag = msgTextFieldTag;
    msgField.delegate = self;
    [msgField setBorderStyle:UITextBorderStyleLine];
    msgField.font = [UIFont fontWithName:@"TimesNewRoman" size:12.0f];
    msgField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    msgField.returnKeyType = UIReturnKeyDone;
    [scrollView addSubview:msgField];
    
    UIButton *cancelBtn  = [[UIButton alloc]init];
    [cancelBtn setBackgroundColor:[UIColor redColor]];
    if(IS_RETINA_3_5){
        cancelBtn.frame = CGRectMake(20, 365, 120, 35);
    }
    else
    {
        cancelBtn.frame = CGRectMake(20, 410, 120, 35);
    }
    [cancelBtn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [scrollView addSubview:cancelBtn];
    
    UIButton *submitBtn = [[UIButton alloc]init];
    [submitBtn setBackgroundColor:[UIColor redColor]];
    if(IS_RETINA_3_5){
        submitBtn.frame = CGRectMake(180, 365, 120, 35);
    }
    else
    {
        submitBtn.frame = CGRectMake(180, 410, 120, 35);
    }
    [submitBtn addTarget:self action:@selector(submitBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [scrollView addSubview:submitBtn];
    
     textFieldArray= [[NSMutableArray alloc]initWithObjects:nameField,emailField,subjectField,msgField, nil];
    
}
-(void)cancelBtnClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)submitBtnClicked
{
    if(nil != nameField)
    {
        [nameField resignFirstResponder];
    }
    if(nil != emailField)
    {
        [emailField resignFirstResponder];
    }
    if(nil != subjectField)
    {
        [subjectField resignFirstResponder];
    }
    if (nil != msgField) {
        [msgField resignFirstResponder];
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:[NSString stringWithFormat:@"%@ posted successfully",nameField.text] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL didResign = [textField resignFirstResponder];
    if (!didResign) return NO;
    
    NSUInteger index = [textFieldArray indexOfObject:textField];
    if (index == NSNotFound || index + 1 == textFieldArray.count) return NO;
    
    id nextField = [textFieldArray objectAtIndex:index + 1];
    activeField = nextField;
    [nextField becomeFirstResponder];
    
    return NO;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
 }
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(textField.tag == subTextFieldTag)
    {
        if(!UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            originalFrame = self.view.frame;
            [self animateKeyboard:CGRectMake(0, self.view.frame.origin.y-90, self.view.frame.size.width, self.view.frame.size.height)];
            
        }
    }
    if(textField.tag == msgTextFieldTag)
    {
        if(!UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [self animateKeyboard:originalFrame];
        }
    }
}

-(void) animateKeyboard:(CGRect) frame
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    self.view.frame = frame;
    [UIView commitAnimations];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"#"]) {
        return NO;
    }
    else {
        return YES;
    }
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
