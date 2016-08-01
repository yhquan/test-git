//
//  CTTableViewCellData.h
//  Ape_SL
//
//  Created by TangQiao on 13-1-6.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import <UIKit/UIkit.h>
#import <CoreText/CoreText.h>

@interface ImageData : NSObject

@property (strong, nonatomic) NSString * imageId;
@property (assign, nonatomic) NSInteger position;
/// the position is based on CoreText coordinate system, NOT view coordinate system.
@property (assign, nonatomic) CGRect imagePosition;

@end

@interface FormulaData : NSObject

@property (strong, nonatomic) NSString * latex;
@property (nonatomic) NSInteger position;
/// the position is based on CoreText coordinate system, NOT view coordinate system.
@property (nonatomic) CGRect formulaPosition;

@end

@interface LinkData : NSObject

@property (strong, nonatomic) NSString * url;
@property (strong, nonatomic) NSString * text;
@property (nonatomic) NSRange range;

@end

@interface BlankFillingData: NSObject

@property (strong, nonatomic) NSString *text;
@property (nonatomic) NSInteger position;
/// the position is based on CoreText coordinate system, NOT view coordinate system.
@property (nonatomic) CGRect blankFillingPosition;

@end

@interface ChoiceData: NSObject

@property (strong, nonatomic) NSString *text;
@property (nonatomic) NSInteger position;
/// the position is based on CoreText coordinate system, NOT view coordinate system.
@property (nonatomic) CGRect choicePosition;

@end

@interface HighlightData: NSObject

@property (nonatomic) NSRange range;
@property (nonatomic) NSInteger colorIndex;

- (id)initWithDictionary:(NSDictionary *)dictionaryValue;
- (NSDictionary *)dictionaryValue;

@end

@interface CoreTextData : NSObject

@property (assign, nonatomic) CTFrameRef ctFrame;
@property (strong, nonatomic) NSAttributedString * attributedString;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *formulaArray;
@property (strong, nonatomic) NSArray *linkArray;
@property (strong, nonatomic) NSArray *blankFillingArray;
@property (strong, nonatomic) NSArray *choiceArray;
@property (strong, nonatomic) NSArray *highlightDataArray;
@property (assign, nonatomic) CGFloat cellHeight;

@property (strong, nonatomic) UIImage * prefixImage;

// valid only ctFrame == nil, when FrameParser finds the json data is invalid,
// it will set the titleString value instead.
@property (strong, nonatomic) NSString * titleString;

// 用来对齐
- (CGFloat)firstLineY;
- (CGFloat)firstLineHeight;
- (NSUInteger)lineCount;

@end
