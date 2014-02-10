//
//  ViewController.m
//  Clone
//
//  Created by Nagarajan on 2/5/14.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import "ViewController.h"
#import "ContactViewController.h"

#define IS_RETINA_3_5 ([UIScreen mainScreen].bounds.size.height == 480.0)
#define IS_RETINA_4 ([UIScreen mainScreen].bounds.size.height == 568.0)

@interface ViewController ()

@end

@implementation ViewController
@synthesize pageImages = _pageImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *toolbarView = nil;
    if(IS_RETINA_3_5){
        toolbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60)];
    }
    else{
        toolbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60)];
    }
    toolbarView.backgroundColor = [UIColor redColor];
    [self.view addSubview:toolbarView];
    
    UILabel * contactlabel = [[UILabel alloc]initWithFrame:CGRectMake(130,25,120,25)];
    contactlabel.text = @"Home";
    contactlabel.textColor = [UIColor blackColor];
    [toolbarView addSubview:contactlabel];

    _pageImages = @[@"Bike1.jpg", @"Bike2.jpg", @"Bike3.jpg", @"Bike4.jpg"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    if(IS_RETINA_3_5){
        self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height -180);
    }
    else
    {
        self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height -210);
    }
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    UIView* contactView = nil;
    if (IS_RETINA_3_5) {
        
        contactView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height -130, self.view.frame.size.width, 130)];
    }
    else{
        contactView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height -150, self.view.frame.size.width, 150)];
    }
    
    [contactView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:contactView];
    
    UIButton *contactBtn = [[UIButton alloc]init];
    [contactBtn setBackgroundColor:[UIColor redColor]];
    if(IS_RETINA_3_5){
        contactBtn.frame = CGRectMake(100, 35, 120, 35);
    }
    else
    {
        contactBtn.frame = CGRectMake(100, 50, 120, 35);
    }
    [contactBtn addTarget:self action:@selector(contactBtnClk) forControlEvents:UIControlEventTouchUpInside];
    [contactBtn setTitle:@"Contact Us" forState:UIControlStateNormal];
    [contactView addSubview:contactBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)contactBtnClk
{
    ContactViewController *contact = [[ContactViewController alloc]init];
    contact.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    contact.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:contact animated:YES completion:nil];
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageImages count] == 0) || (index >= [self.pageImages count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
