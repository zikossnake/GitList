//
//  GitListQuery.h
//  GitList
//
//  Created by Zakaria on 07/04/2019.
//  Copyright © 2019 Zakaria. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GitListQuery : NSObject


/**
 async request for git JSON

 @param compBlock compeltion block
 */
- (void)gitGetList:(void(^)(NSArray *))compBlock;

@end

NS_ASSUME_NONNULL_END
