//
//  GitListQuery.m
//  GitList
//
//  Created by Zakaria on 07/04/2019.
//  Copyright © 2019 Zakaria. All rights reserved.
//

#import "GitListQuery.h"
#import "GitListModel.h"
#import <AFNetworking.h>

@implementation GitListQuery

- (void)gitGetList:(void(^)(NSArray *))compBlock
{
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            compBlock([self processingJsonDic:[responseObject objectForKey:@"items"]]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:requestOperation];
}

//processing needed values for tableview
- (NSArray *)processingJsonDic:(NSArray *)response
{
    NSMutableArray *modelArray = [NSMutableArray new];
    for (NSDictionary *dict in response) {
        GitListModel *model = [GitListModel new];
        model.gitName = [dict objectForKey:@"full_name"];
        model.gitDescription = [dict objectForKey:@"description"];
        float starsCount = [[dict objectForKey:@"stargazers_count"] intValue];
        if (starsCount/1000)
            model.gitStars = [NSString stringWithFormat:@"%.2fK",starsCount/1000];
        else
            model.gitStars = [dict objectForKey:@"stargazers_count"];
        model.gitOwnerName = [[dict objectForKey:@"owner"] objectForKey:@"login"];
        model.gitOwnerAvatar = [[dict objectForKey:@"owner"] objectForKey:@"avatar_url"];
        
        [modelArray addObject:model];
    }
    
    return modelArray;
}

@end
