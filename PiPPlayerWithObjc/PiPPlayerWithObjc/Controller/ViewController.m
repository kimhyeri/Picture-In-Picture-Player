//
//  ViewController.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/03.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import "TableViewCell.h"
#import "PiPAVPlayerViewController.h"
#import "Videos.h"

@interface ViewController () <
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) Videos *videos;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videos = [[Videos alloc] init];

    [self setup];
}

- (void)setup {
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass: TableViewCell.self forCellReuseIdentifier: @"cell"];
    
    [self.view addSubview: self.tableView];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    cell.textLabel.text = [self.videos.list objectAtIndex: indexPath.row].title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.videos.list count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PiPAVPlayerViewController *vc = [[PiPAVPlayerViewController alloc] init];
    vc.urlString = [self.videos.list objectAtIndex: indexPath.row].source;
    [self.navigationController pushViewController:vc animated:NO];
}

@end
