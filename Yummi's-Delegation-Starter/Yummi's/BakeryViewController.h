//
//  ViewController.h
//  Yummi's
//
//  Created by Lea Marolt on 4/4/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookieList.h"

@interface BakeryViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *first;
@property (weak, nonatomic) IBOutlet UILabel *second;
@property (weak, nonatomic) IBOutlet UILabel *third;

@property (nonatomic, strong) NSMutableArray *todaysCookies;
@property (weak, nonatomic) IBOutlet UILabel *dayCount;

@end

