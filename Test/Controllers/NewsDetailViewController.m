//
//  NewsDetailViewController.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "NewsDetailViewController.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "ROShareBehavior.h"
#import "ROTextStyle.h"
#import "ROImageCellDescriptor.h"
#import "ROTextCellDescriptor.h"
#import "ROHeaderCellDescriptor.h"
#import "ROOptionsFilter.h"
#import "ROSingleDataLoader.h"
#import "NewsScreen1DSItem.h"
#import "NewsScreen1DS.h"
#import "NSDate+RO.h"

@interface NewsDetailViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end

@implementation NewsDetailViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:[[DatasourceManager sharedInstance] newsScreen1DS]
                                                           optionsFilter:self.optionsFilter];
    
        [self.behaviors addObject:[ROShareBehavior behaviorViewController:self]];
        
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

    [[[ROUtils sharedInstance] analytics] logPage:@"NewsDetail"];

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

- (void)configureWithDataItem:(NewsScreen1DSItem *)item {
    self.title = item.title;
    self.items = @[
                   [ROTextCellDescriptor text:[item.date stringValue] action:nil textStyle:[ROTextStyle style:ROFontSizeStyleSmall bold:NO italic:YES textAligment:NSTextAlignmentLeft textColor:@"#ee590b"]],
                   [ROTextCellDescriptor text:item.content action:nil textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]]
                  ];
}

@end
