//
//  GitListCustomCell.h
//  GitList
//
//  Created by Zakaria on 06/04/2019.
//  Copyright © 2019 Zakaria. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GitListCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *gitName;
@property (weak, nonatomic) IBOutlet UILabel *gitDescription;
@property (weak, nonatomic) IBOutlet UILabel *gitStars;

@property (weak, nonatomic) IBOutlet UILabel *gitOwnerName;
@property (weak, nonatomic) IBOutlet UIImageView *gitOwnerAvatar;


@end

NS_ASSUME_NONNULL_END
