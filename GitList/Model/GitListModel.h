//
//  GitListModel.h
//  GitList
//
//  Created by Zakaria on 06/04/2019.
//  Copyright © 2019 Zakaria. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GitListModel : NSObject

@property (nonatomic, retain) NSString *gitName;
@property (nonatomic, retain) NSString *gitDescription;
@property (nonatomic, retain) NSString *gitStars;

@property (nonatomic, retain) NSString *gitOwnerName;
@property (nonatomic, retain) NSString *gitOwnerAvatar;

@end

NS_ASSUME_NONNULL_END
