//
//  FPPetProfileController.m
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPPetProfileController.h"
#import "AppDelegate.h"

@interface FPPetProfileController ()

@end

@implementation FPPetProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI {
    
    self.buttonBarView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.selectedBar.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.selectedBarHeight = 0;
    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
    
    self.changeCurrentIndexBlock = ^(XLButtonBarViewCell* oldCell, XLButtonBarViewCell *newCell, BOOL animated){
        
        oldCell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        newCell.backgroundColor = [UIColor whiteColor];
        
        if (animated) {
            [UIView animateWithDuration:0.1
                             animations:^(){
                                 newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                 oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
                             }
                             completion:nil];
        }
        else{
            newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
            oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    UIViewController *info = [self.storyboard instantiateViewControllerWithIdentifier:@"FPPetInfoController"];
    UIViewController *image = [self.storyboard instantiateViewControllerWithIdentifier:@"FPPetImageController"];
    UIViewController *contact = [self.storyboard instantiateViewControllerWithIdentifier:@"FPPetContactController"];
    return @[info, image, contact];
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
