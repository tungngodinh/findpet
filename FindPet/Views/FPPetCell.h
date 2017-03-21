//
//  FPPetCell.h
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kFPPetCellIdentifier = @"FPPetCell";

@interface FPPetCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *pictureImage;
@property (nonatomic, weak) IBOutlet UIImageView *locationImage;
@property (nonatomic, weak) IBOutlet UIImageView *pawImage;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end
