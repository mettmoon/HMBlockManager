//
//  HMBlockManager.h
//  HMBlockManager
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMBlockManager : NSObject
@property (nonatomic, readonly) NSString *repositoryIdentifier;//저장될 아이디값 UserDefault의 key값으로 사용됩니다.
@property (nonatomic, assign, getter = isAutoSaveMode) BOOL autoSaveMode;//데이터가 변했을 때 자동 저장여부
- (id)initWithRepositoryIdentifier:(NSString *)repositoryIdentifier; //이걸로 초기화해서 쓰세요
- (void)setBlockIdentifier:(NSString *)identifier endDate:(NSDate *)endDate; //endDate까지 identifier를 Block합니다.
- (void)removeBlockIdentifier:(NSString *)identifier; //해당 identifier를 Block해제합니다.
- (BOOL)isBlockIdentifier:(NSString *)identifier; //Block 여부를 알려줍니다.
- (void)clearBlockIdentifier;//블럭데이터를 삭제합니다.
- (NSDate *)endDateWithIdentifier:(NSString *)identifier;//해당값의 block enddate를 반환합니다. block 없는경우 nil을 반환합니다
- (NSArray *)blockIdentifierList; //현재 차단된것들의 identifier를 array로 반환합니다.
- (void)save; //저장합니다 autoSaveMode가 NO일 때 사용하세요.

@end
