//
//  EmployeesDetailViewController.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "EmployeesDetailViewController.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "RODeleteItemBehavior.h"
#import "ROShareBehavior.h"
#import "ROPhoneAction.h"
#import "ROMailAction.h"
#import "ROTextStyle.h"
#import "ROImageCellDescriptor.h"
#import "ROTextCellDescriptor.h"
#import "ROHeaderCellDescriptor.h"
#import "ROOptionsFilter.h"
#import "ROSingleDataLoader.h"
#import "EmployeesDBDSItem.h"
#import "EmployeesDBDS.h"

@interface EmployeesDetailViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end

@implementation EmployeesDetailViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] employeesDBDS]
                                                           optionsFilter:self.optionsFilter];
    
        [self.behaviors addObject:[ROShareBehavior behaviorViewController:self]];
        
        [self.behaviors addObject:[RODeleteItemBehavior behaviorViewController:self]];
        
    }
    return self;
}

#pragma mark - Properties init

- (ROOptionsFilter *)optionsFilter {

    if (!_optionsFilter) {
        _optionsFilter = [ROOptionsFilter new];
    }
    return _optionsFilter;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"EmployeesDetail"];

    self.title = nil;
    
    self.customTableViewDelegate = self;

    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }

    [self updateViewConstraints];

    [self loadData];
}

#pragma mark - ROCustomTableViewDelegate

- (void)configureWithDataItem:(EmployeesDBDSItem *)item {
    self.title = [NSString stringWithFormat:@"%@%@%@", item.name, @" ", item.lastname];
    self.items = @[
                   [ROImageCellDescriptor imageString:[self.dataLoader.datasource imagePath:item.picture] action:nil],
                   [ROHeaderCellDescriptor text:@"Email"],
                   [ROTextCellDescriptor text:item.email action:[[ROMailAction alloc] initWithValue:item.email] textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]],
                   [ROHeaderCellDescriptor text:@"Phone"],
                   [ROTextCellDescriptor text:item.phone action:[[ROPhoneAction alloc] initWithValue:item.phone] textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]]
                  ];
}

@end
