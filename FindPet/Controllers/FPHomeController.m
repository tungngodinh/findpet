//
//  FPHomeController.m
//  FindPet
//
//  Created by tungnd on 3/11/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <LSBLEManager/LSBluetoothManager.h>

#import "FPHomeController.h"

@interface FPHomeController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
    
@end

@implementation FPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
