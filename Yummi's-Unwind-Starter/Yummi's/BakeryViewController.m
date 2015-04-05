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
        self.dayCount.text = [NSString stringWithFormat:@"Day %i", days];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CookieList *cookieListController = [segue destinationViewController];
    cookieListController.dayNum = days;
}

- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segue {
    
    if ([segue.sourceViewController isKindOfClass:[CookieList class]]) {
        CookieList *cookieViewConroller = segue.sourceViewController;

        self.todaysCookies = cookieViewConroller.selectedCookies;
        self.first.text = ((Cookie *)self.todaysCookies[0]).name;
        self.second.text = ((Cookie *)self.todaysCookies[1]).name;
        self.third.text = ((Cookie *)self.todaysCookies[2]).name;
    }
}


@end
