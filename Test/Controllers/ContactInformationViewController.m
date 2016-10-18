//
//  ContactInformationViewController.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "ContactInformationViewController.h"
#import "DatasourceManager.h"
#import "ROUtils.h"
#import "ROPhoneAction.h"
#import "ROMapSearchAction.h"
#import "ROTextStyle.h"
#import "ROImageCellDescriptor.h"
#import "ROTextCellDescriptor.h"
#import "ROHeaderCellDescriptor.h"
#import "ROOptionsFilter.h"
#import "ROSingleDataLoader.h"
#import "Item.h"
#import "EmptyDatasource.h"

@interface ContactInformationViewController ()

@property (nonatomic, strong) ROOptionsFilter *optionsFilter;

@end

@implementation ContactInformationViewController

- (instancetype)init {

    self = [super init];
    if (self) {

        self.dataLoader = [[ROSingleDataLoader alloc] initWithDatasource:[EmptyDatasource new]
                                                           optionsFilter:self.optionsFilter];

    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [[[ROUtils sharedInstance] analytics] logPage:@"ContactInformation"];

    self.title = NSLocalizedString(@"Contact Information", nil);

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

#pragma mark - Properties init

- (ROOptionsFilter *)optionsFilter {

    if (!_optionsFilter) {

        _optionsFilter = [ROOptionsFilter new];
        
    }
    return _optionsFilter;
}

#pragma mark - ROCustomTableViewDelegate

- (void)configureWithDataItem:(Item *)item {
    self.items = @[
                   [ROHeaderCellDescriptor text:@"Address"],
                   [ROTextCellDescriptor text:@"Evergreen Dr, Clifton, New Jersey 07014, USA" action:[[ROMapSearchAction alloc] initWithValue:@"Evergreen Dr, Clifton, New Jersey 07014, USA"] textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]],
                   [ROHeaderCellDescriptor text:@"Phone Number"],
                   [ROTextCellDescriptor text:@"(555) 704-3829" action:[[ROPhoneAction alloc] initWithValue:@"(555) 704-3829"] textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]],
                   [ROHeaderCellDescriptor text:@"Email"],
                   [ROTextCellDescriptor text:@"company@company.com" action:nil textStyle:[ROTextStyle style:ROFontSizeStyleMedium bold:NO italic:NO textAligment:NSTextAlignmentLeft]]
                  ];
}

@end
