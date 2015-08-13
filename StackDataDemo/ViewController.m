//
//  ViewController.m
//  StackDataDemo
//
//  Created by Jason Wang on 8/11/15.
//  Copyright (c) 2015 Jason Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *popButton;
@property (weak, nonatomic) IBOutlet UIButton *popToFirstView;
@property (weak, nonatomic) IBOutlet UILabel *viewControllerCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *viewsToAddTextField;
@property (weak, nonatomic) IBOutlet UITextField *popOffViewsTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllerCountLabel.text = [NSString stringWithFormat: @"%ld", self.navigationController.viewControllers.count];
    
    
    if (self.navigationController.viewControllers.count == 1) {
        self.popButton.hidden=YES;
        self.popToFirstView.hidden=YES;
    }
}

- (IBAction)popOffViewsSubmit:(UIButton *)sender {
    
    NSLog(@"pop off button tapped");
    NSInteger userViewNum = [self.popOffViewsTextField.text intValue];
    
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    for (NSInteger i = userViewNum; i > 0 ; i--) {
        [controllers removeLastObject];
    }
    
    [self.navigationController setViewControllers:controllers animated:YES];

}


- (IBAction)viewsToAddSubmit:(UIButton *)sender {
    
    NSInteger userViewNum = [self.viewsToAddTextField.text intValue];
    
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    for (int i = 0 ; i < userViewNum; i++) {
        ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerIdentifier"];
        [controllers addObject:viewController];
    }
    [self.navigationController setViewControllers:controllers animated:YES];
    


    
}

- (IBAction)popToFirstView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"Pop to Root");
    NSLog(@"%lu", self.navigationController.viewControllers.count);
}

- (IBAction)popButtonTapped:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Pop Tapped");
    NSLog(@"%lu", self.navigationController.viewControllers.count);
    
}



- (IBAction)pushButtonTapped:(id)sender {
    
    NSLog(@"Button Tapped");
    
    [self pushViewController];
    
    NSLog(@"%lu", (unsigned long)self.navigationController.viewControllers.count);
    
}

-(void)pushViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerIdentifier"];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
