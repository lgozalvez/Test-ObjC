//
//  UILabel+RO.m
//  Test
//
//  This App has been generated using IBM Mobile App Builder
//

#import "UILabel+RO.h"
#import "ROTextStyle.h"
#import "ROStyle.h"

@import Colours;

@implementation UILabel (RO)

- (void)ro_style:(ROTextStyle *)textStyle
{
    if (textStyle == nil) {
        textStyle = [ROTextStyle style:ROFontSizeStyleMedium
                                  bold:NO
                                italic:NO
                          textAligment:NSTextAlignmentLeft
                             textColor:[[ROStyle sharedInstance] foregroundColor]];
    }
    self.font = [textStyle font];
    self.textColor = textStyle.textColor;
    self.textAlignment = textStyle.textAligment;
}

@end
