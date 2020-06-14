//
//  ViewController.m
//  Fonts
//
//  Created by Alexey Baryshnikov on 14.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"numberOfRowsInSection %ld", section);
    NSArray *fontFamilyNames = [UIFont familyNames];
    NSString *familyName = [fontFamilyNames objectAtIndex:section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return [fontNames count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *fontFamilyNames = [UIFont familyNames];
    NSString *familyName = [fontFamilyNames objectAtIndex:section];
    return familyName;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        NSLog(@"CELL CREATED");
    } else {
//        NSLog(@"cell reused");
    }
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    NSLog(@"cellForRowAtIndexPath {%ld, %ld}", indexPath.section, indexPath.row);
    
    NSArray *fontFamilyNames = [UIFont familyNames];
    NSString *familyName = [fontFamilyNames objectAtIndex:indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *font = [fontNames objectAtIndex:indexPath.row];
    cell.textLabel.text = font;
    cell.textLabel.font = [UIFont fontWithName:font size:16];
//    cell.textLabel.text = [NSString stringWithFormat:@"sec: %ld, row: %ld",indexPath.section, indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];
}

@end
