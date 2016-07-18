//
//  MSTableViewController.m
//  MSTableVIewBlurEffects
//
//  Created by mr.scorpion on 16/7/18.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

#import "MSTableViewController.h"

@interface MSTableViewController ()
@property (nonatomic, strong) NSArray *words;
@end

@implementation MSTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *blurBackground = [[UIView alloc] initWithFrame:self.tableView.bounds];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:blurBackground.bounds];
    imageView.image = [UIImage imageNamed:@"gorgeousimage"];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = blurBackground.bounds;
    [blurBackground addSubview:imageView];
    [blurBackground addSubview:blurView];

    self.tableView.backgroundView = blurBackground;
    self.tableView.separatorEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    self.words = [@"Doesn't this look awesome by mr scorpion" componentsSeparatedByString:@" "];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:26];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.words[indexPath.row];
    return cell;
}
@end
