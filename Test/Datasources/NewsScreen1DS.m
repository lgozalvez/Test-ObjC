//
//  NewsScreen1DS.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "NewsScreen1DS.h"
#import "ROUtils.h"
#import "NSString+RO.h"
#import "NewsScreen1DSItem.h"

@implementation NewsScreen1DS

static NSString *const kUrl             = @"https://ibm-pods.buildup.io";
static NSString *const kApiKey          = @"Eq0PGMdh";
static NSString *const kResourceId      = @"/app/5806036fab75b70300027919/r/newsScreen1DS";

- (instancetype)init {

    self = [super initWithUrlString:kUrl 
                             apiKey:kApiKey 
                         resourceId:kResourceId 
                       objectsClass:[NewsScreen1DSItem class]];
    if (self) {
    
        self.delegate = self;
    }
    return self;
}

- (NSString *)imagePath:(NSString *)path {
  
    if ([path isUrl]) {
        return path;
    }

    return [NSString stringWithFormat:@"https://ibm-pods.buildup.io/app/5806036fab75b70300027919%@?apikey=%@", path, self.apiKey];
}

#pragma mark - <ROSearchable>

- (NSArray *)searchableFields {

    return @[kNewsScreen1DSItemTitle, kNewsScreen1DSItemSubtitle, kNewsScreen1DSItemContent, kNewsScreen1DSItemId];
}

#pragma mark - <ROCRUDServiceDelegate>

- (void)itemsWithParams:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    [self.restClient get:self.resourceId 
                  params:params 
           responseClass:self.objectsClass
            successBlock:successBlock 
            failureBlock:failureBlock];
}

- (void)itemWithIdentifier:(NSString *)identifier successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSString *service = [NSString stringWithFormat:@"%@/%@", self.resourceId, identifier];
    [self.restClient get:service 
                  params:nil 
           responseClass:self.objectsClass 
            successBlock:^(id response) {
              
                [[[ROUtils sharedInstance] analytics] logAction:@"read"
                                                         entity:@"NewsScreen1DSItem"
                                                     identifier:identifier];
                if (successBlock) {
                    
                    successBlock(response);
                }
                
            } failureBlock:failureBlock];
}

- (void)createItemWithParams:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    [self.restClient post:self.resourceId 
                   params:params 
            responseClass:self.objectsClass 
             successBlock:^(id response) {
                 
                 [[[ROUtils sharedInstance] analytics] logAction:@"created"
                                                          entity:@"NewsScreen1DSItem"];
                 if (successBlock) {
                     
                     successBlock(response);
                 }
                 
             } failureBlock:failureBlock];
}

- (void)updateItemWithIdentifier:(NSString *)identifier params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSString *service = [NSString stringWithFormat:@"%@/%@", self.resourceId, identifier];
    [self.restClient put:service 
                  params:params 
           responseClass:self.objectsClass 
            successBlock:^(id response) {
                
                [[[ROUtils sharedInstance] analytics] logAction:@"updated"
                                                         entity:@"NewsScreen1DSItem"
                                                     identifier:identifier];
                if (successBlock) {
                    
                    successBlock(response);
                }
                
            } failureBlock:failureBlock];
    
}

- (void)deleteItemWithIdentifier:(NSString *)identifier successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSString *service = [NSString stringWithFormat:@"%@/%@", self.resourceId, identifier];
    [self.restClient delete:service 
                     params:nil 
              responseClass:nil 
               successBlock:^(id response) {
                   
                   [[[ROUtils sharedInstance] analytics] logAction:@"deleted"
                                                            entity:@"NewsScreen1DSItem"
                                                        identifier:identifier];
                   if (successBlock) {
                       
                       successBlock(response);
                   }
                   
               } failureBlock:failureBlock];
}

- (void)deleteItemsWithIdentifiers:(NSArray *)identifiers successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    NSString *service = [NSString stringWithFormat:@"%@/deleteByIds", self.resourceId];
    [self.restClient post:service
                   params:identifiers 
            responseClass:nil
             successBlock:^(id response) {
                 
                 [[[ROUtils sharedInstance] analytics] logAction:@"deleted"
                                                          entity:@"NewsScreen1DSItem"
                                                      identifier:[identifiers componentsJoinedByString:@", "]];
                 if (successBlock) {
                     
                     successBlock(response);
                 }
                 
             } failureBlock:failureBlock];
}

@end
