//
//  HMBlockManager.m
//  HMBlockManager
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import "HMBlockManager.h"
@interface HMBlockManager()
@property (nonatomic, strong) NSMutableDictionary *dataDic;
@end
@implementation HMBlockManager
- (id)init{
    self = [super init];
    if(self){
    }
    return self;
}
- (id)initWithRepositoryIdentifier:(NSString *)repositoryIdentifier{
    self = [self init];
    if(self){
        _repositoryIdentifier = repositoryIdentifier;
        [self setup];
    }
    return self;
}
- (NSMutableDictionary *)dataDic{
    if(_dataDic==nil){
        _repositoryIdentifier = [[NSUUID UUID] UUIDString];
        [self setup];
    }
    return _dataDic;
}
- (void)setup{
    NSData *archiveData = [[NSUserDefaults standardUserDefaults] objectForKey:self.repositoryIdentifier];
    if(archiveData){
        self.dataDic = [[NSMutableDictionary alloc] initWithDictionary:[NSKeyedUnarchiver unarchiveObjectWithData:archiveData]];
    }else{
        self.dataDic = [NSMutableDictionary new];
    }
}
- (void)setBlockIdentifier:(NSString *)identifier endDate:(NSDate *)endDate{
    [self.dataDic setObject:endDate forKey:identifier];
    if(self.isAutoSaveMode)[self save];
}
- (void)removeBlockIdentifier:(NSString *)identifier{
    [self.dataDic removeObjectForKey:identifier];
    if(self.isAutoSaveMode)[self save];
}
- (BOOL)isBlockIdentifier:(NSString *)identifier{
    NSDate *currentDate = [NSDate new];
    NSDate *targetDate = [self.dataDic objectForKey:identifier];
    if(targetDate){
        NSTimeInterval gap = [targetDate timeIntervalSinceDate:currentDate];
        return gap > 0;
    }else{
        return NO;
    }
    
}
- (void)clearBlockIdentifier{
    [self.dataDic removeAllObjects];
    if(self.isAutoSaveMode)[self save];
}
- (NSDate *)endDateWithIdentifier:(NSString *)identifier{
    NSDate *targetDate = [self.dataDic objectForKey:identifier];
    return targetDate;
    
}
- (NSArray *)blockIdentifierList{
    NSMutableArray *blockedIdentifierList = [NSMutableArray new];
    for(NSString *identifier in self.dataDic){
        if([self isBlockIdentifier:identifier]){
            [blockedIdentifierList addObject:identifier];
        }
    }
    return blockedIdentifierList;
}
- (void)save{
    NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject:self.dataDic];
    [[NSUserDefaults standardUserDefaults] setObject:archiveData forKey:@"NotificationList"];
}

@end
