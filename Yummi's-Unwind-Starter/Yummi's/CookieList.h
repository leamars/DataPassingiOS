//
//  CookiesTableViewController.h
//  Yummi's
//
//  Created by Lea Marolt on 4/4/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cookie.h"

@interface CookieList : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cookieListTableView;
@property (weak, nonatomic) IBOutlet UILabel *numOfSelected;
@property (nonatomic, strong) NSArray *todaySelections;
@property (nonatomic) int dayNum;
@property (weak, nonatomic) IBOutlet UILabel *dayNumLabel;
@property (nonatomic, strong) NSMutableArray *selectedCookies;

- (IBAction)saveSelection:(id)sender;

@end
