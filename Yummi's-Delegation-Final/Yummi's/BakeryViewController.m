//
//  ViewController.m
//  Yummi's
//
//  Created by Lea Marolt on 4/4/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

#import "BakeryViewController.h"
#import "Cookie.h"

@interface BakeryViewController () {
    int days;
}

@end

@implementation BakeryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.todaysCookies = [NSMutableArray new];
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"Days: %i", days);
    
    if (!days && days != 0) {
        days = 0;
        self.dayCount.text = [NSString stringWithFormat:@"Day %i", days];
    }
    else {
        days = days + 1;
        self.dayCount.text = [NSString stringWithFormat:@"Day %i", days-1];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CookieList *cookieListController = [segue destinationViewController];
    cookieListController.delegate = self;
    cookieListController.todaySelections = self.todaysCookies;
    cookieListController.dayNum = days;
    
}

- (void) selectedCookies:(NSArray *)selectedCookies {
    
    self.todaysCookies = [NSMutableArray arrayWithArray:selectedCookies];
    
    self.first.text = [NSString stringWithFormat:@"1. %@", ((Cookie *)self.todaysCookies[0]).name];
    self.second.text = [NSString stringWithFormat:@"2. %@", ((Cookie *)self.todaysCookies[1]).name];
    self.third.text = [NSString stringWithFormat:@"3. %@", ((Cookie *)self.todaysCookies[2]).name];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
