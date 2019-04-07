//
//  ViewController.m
//  GitList
//
//  Created by Zakaria on 06/04/2019.
//  Copyright © 2019 Zakaria. All rights reserved.
//

#import "ViewController.h"
#import "GitListCustomCell.h"
#import "GitListQuery.h"
#import "GitListModel.h"
#import "UIImageView+AFNetworking.h"

#define CELLIDENTIFER @"GitCell"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tableView;
    NSArray *gitArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GitListQuery *listQuery = [GitListQuery new];
    [listQuery gitGetList:^(NSArray * modelArray) {
        NSLog(@"modelArray : %@",modelArray);
        self->gitArray = modelArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->tableView reloadData];
        });
    }];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 600;
    [self.view addSubview:tableView];
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [tableView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [tableView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [tableView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;

    [self.view layoutIfNeeded];
}


#pragma TableViewDelegation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return gitArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GitListCustomCell *gitCell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFER];
    if (!gitCell) {
        [tableView registerNib:[UINib nibWithNibName:@"GitListCustomCell" bundle:nil] forCellReuseIdentifier:CELLIDENTIFER];
        gitCell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFER];
    }
    GitListModel *model = [gitArray objectAtIndex:indexPath.row];
    gitCell.gitName.text = model.gitName;
    gitCell.gitDescription.text = model.gitDescription;
    gitCell.gitStars.text = model.gitStars;
    
    gitCell.gitOwnerName.text = model.gitOwnerName;
    [gitCell.gitOwnerAvatar setImageWithURL:[NSURL URLWithString:model.gitOwnerAvatar]];
    
    return gitCell;
}

@end
