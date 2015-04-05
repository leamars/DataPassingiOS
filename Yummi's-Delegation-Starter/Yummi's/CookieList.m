//
//  CookiesTableViewController.m
//  Yummi's
//
//  Created by Lea Marolt on 4/4/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

#import "CookieList.h"

@interface CookieList ()

@end

@implementation CookieList {
    NSArray *cookies;
    NSMutableArray *selectedCookies;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configureInfo {
    
    Cookie *firstCookie = [Cookie new];
    Cookie *secondCookie = [Cookie new];
    Cookie *thirdCookie = [Cookie new];
    Cookie *fourthCookie = [Cookie new];
    Cookie *fifthCookie = [Cookie new];
    Cookie *sixthCookie = [Cookie new];
    Cookie *seventhCookie = [Cookie new];
    Cookie *eighthCookie = [Cookie new];
    Cookie *ninthCookie = [Cookie new];
    Cookie *tenthCookie = [Cookie new];
    Cookie *eleventhCookie = [Cookie new];
    Cookie *twelvthCookie = [Cookie new];
    
    firstCookie.name = @"Chocolate Chip";
    secondCookie.name = @"Fudge Cookie";
    thirdCookie.name = @"Snickerdoodle";
    fourthCookie.name = @"Ooh-La-La Oatmeal";
    fifthCookie.name = @"Sensational Sugar";
    sixthCookie.name = @"Peanut Butter Pizazz";
    seventhCookie.name = @"Toffee Temptation";
    eighthCookie.name = @"Caramel Pecan";
    ninthCookie.name = @"Pistachio Perfection";
    tenthCookie.name = @"Macademia Nut White Chocolate Chip";
    eleventhCookie.name = @"Cinnamon Rolled";
    twelvthCookie.name = @"Hunka Chunka";
    
    cookies = @[firstCookie, secondCookie, thirdCookie, fourthCookie, fifthCookie, sixthCookie, seventhCookie, eighthCookie, ninthCookie, tenthCookie, eleventhCookie, twelvthCookie];
    
    selectedCookies = [[NSMutableArray alloc] initWithCapacity:20];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [cookies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CookieCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = ((Cookie *)cookies[indexPath.row]).name;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    Cookie *cookie = cookies[indexPath.row];
    
    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType != UITableViewCellAccessoryCheckmark && [selectedCookies count] < 3)
    
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedCookies addObject:cookie];
        NSLog(@"Adding cookie!");
        
    }
    
    else
        
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [selectedCookies removeObject:cookie];
        NSLog(@"Removing cookie!");
        
    }
    
    self.numOfSelected.text = [NSString stringWithFormat:@"%lu/3", (unsigned long)[selectedCookies count]];
    
}


- (IBAction)saveSelection:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)clearSelection:(id)sender {
}

@end
