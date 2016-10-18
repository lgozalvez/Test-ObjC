//
//  RONumberFilter.h
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import <Foundation/Foundation.h>
#import "ROFilter.h"

@interface RONumberFilter : NSObject <ROFilter>

@property (nonatomic, strong) NSString *fieldName;

@property (nonatomic, strong) NSNumber *fieldValue;

- (instancetype)initWithFieldName:(NSString *)fieldName value:(NSNumber *)value;

+ (instancetype)filterWithFieldName:(NSString *)fieldName value:(NSNumber *)value;

@end
