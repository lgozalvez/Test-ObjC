//
//  EmployeesFilterViewController.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "EmployeesFilterViewController.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "ROFilterFieldSelection.h"
#import "EmployeesDBDSItemKeys.h"
#import "EmployeesDBDSItem.h"
#import "EmployeesDBDS.h"

@implementation EmployeesFilterViewController

- (void) viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"Employees"];

    self.title = NSLocalizedString(@"Employees", nil);

    self.fields = @[
                     [ROFilterFieldSelection fieldLabel:@"Name"
                                              fieldName:kEmployeesDBDSItemName
                                         formController:self
                                                 single:NO],
                     
                     [ROFilterFieldSelection fieldLabel:@"Lastname"
                                              fieldName:kEmployeesDBDSItemLastname
                                         formController:self
                                                 single:NO],
                     
                     [ROFilterFieldSelection fieldLabel:@"Role"
                                              fieldName:kEmployeesDBDSItemRole
                                         formController:self
                                                 single:NO],
                     
                     [ROFilterFieldSelection fieldLabel:@"Email"
                                              fieldName:kEmployeesDBDSItemEmail
                                         formController:self
                                                 single:NO],
                     
                     [ROFilterFieldSelection fieldLabel:@"Phone"
                                              fieldName:kEmployeesDBDSItemPhone
                                         formController:self
                                                 single:NO],
                     
    ];
}

#pragma mark - Filter actions

- (void)close {
  
    [super close];
}

- (void)cancel {
  
    [super cancel];
}

- (void)submit {

    [super submit];
}

- (void)reset {
  
    [super reset];
}

@end
