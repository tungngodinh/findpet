//
//  FPHomeController.m
//  FindPet
//
//  Created by tungnd on 3/11/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <LSBLEManager/LSBluetoothManager.h>

#import "FPHomeController.h"

@interface FPHomeController ()<UITableViewDataSource, UITableViewDelegate, LSBluetoothManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *peripherals;
@property (nonatomic, strong) LSBluetoothManager *bleManager;
    
@end

@implementation FPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStyleDone target:self action:@selector(onReloadButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = reloadButton;
    self.bleManager = [LSBluetoothManager shareBLEManager];
    self.bleManager.delegate = self;
    self.tableView.tableFooterView = [UIView new];
}
    
- (void)onReloadButtonTapped {
    [self.bleManager scanDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
    
- (void)updateStatue:(BLESTATUE)statue {
    NSLog(@"updateStatue ----- %ld", statue);
}
    
- (void)updateDevices:(NSArray *)devices {
    self.peripherals = [[NSMutableArray alloc] initWithArray:devices];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.peripherals.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    CBPeripheral *pre = self.peripherals[indexPath.row];
//    pre.state
    cell.textLabel.text = pre.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CBPeripheral *pre = self.peripherals[indexPath.row];
    [self.bleManager connectDeviceWithCBPeripheral:pre
                                    andServiceUUID:@"49535343-FE7D-4AE5-8FA9-9FAFD205E455"
                       andOutputCharacteristicUUID:@"49535343-1E4D-4BD9-BA61-23C647249616"
                        andInputCharacteristicUUID:@"49535343-8841-43F4-A8D4-ECBE34729BB3"];
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
