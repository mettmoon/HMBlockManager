//
//  HMBlockManager.h
//  HMBlockManager
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMBlockManager : NSObject
@property (nonatomic, readonly) NSString *repositoryIdentifier;
@property (nonatomic, assign, getter = isAutoSaveMode) BOOL autoSaveMode;
- (id)initWithRepositoryIdentifier:(NSString *)repositoryIdentifier;
- (void)setBlockIdentifier:(NSString *)identifier endDate:(NSDate *)endDate;
- (void)removeBlockIdentifier:(NSString *)identifier;
- (BOOL)isBlockIdentifier:(NSString *)identifier;
- (void)clearBlockIdentifier;
- (NSDate *)endDateWithIdentifier:(NSString *)identifier;
- (NSArray *)blockIdentifierList;
- (void)save;

@end
