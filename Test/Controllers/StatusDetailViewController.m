//
//  StatusDetailViewController.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "StatusDetailViewController.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "RODeleteItemBehavior.h"
#import "ROShareBehavior.h"
#import "ROMapSearchAction.h"
#import "ROTextStyle.h"
#import "ROImageCellDescriptor.h"
#import "ROTextCellDescriptor.h"
#import "ROHeaderCellDescriptor.h"
#import "ROOptionsFilter.h"
#import "ROSingleDataLoader.h"
#import "StatusScreen1DSItem.h"
#import "StatusScreen1DS.h"
#import "NSDate+RO.h"

@interface StatusDetailViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end

@implementation StatusDetailViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] statusScreen1DS]
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

    [[[ROUtils sharedInstance] analytics] logPage:@"StatusDetail"];

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

- (void)configureWithDataItem:(StatusScreen1DSItem *)item {
    self.title = item.employee;
    self.items = @[
                   [ROHeaderCellDescriptor text:@"Status"],
                   [ROTextCellDescriptor text:item.status action:nil textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]],
                   [ROHeaderCellDescriptor text:@"Start Date"],
                   [ROTextCellDescriptor text:[item.startDate ro_datetimeStringValue] action:nil textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]],
                   [ROHeaderCellDescriptor text:@"End Date"],
                   [ROTextCellDescriptor text:[item.endDate ro_datetimeStringValue] action:nil textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]],
                   [ROHeaderCellDescriptor text:@"Location"],
                   [ROTextCellDescriptor text:@"Find on map" action:[[ROMapSearchAction alloc] initWithValue:[item.location stringValue]] textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft textColor:@"#313131"]]
                  ];
}

@end
