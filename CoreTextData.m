//
//  CTTableViewCellData.m
//  Ape_SL
//
//  Created by TangQiao on 13-1-6.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import "CoreTextData.h"
#import <CoreText/CoreText.h>

@implementation ImageData

- (NSString *)description {
    return [NSString stringWithFormat:@"imageId=%@, position=%ld, imagePosition=%@", _imageId, (long)_position,
                                    NSStringFromCGRect(_imagePosition)];
}

@end


@implementation FormulaData

- (NSString *)description {
    return [NSString stringWithFormat:@"latex=%@, position=%ld, formulaPosition=%@", _latex, (long)_position,
                                    NSStringFromCGRect(_formulaPosition)];
}

@end

@implementation LinkData

- (NSString *)description {
    return [NSString stringWithFormat:@"text=%@, url=%@, range=%@", _text, _url, NSStringFromRange(_range)];
}

@end

@implementation ChoiceData

- (NSString *)description {
    return [NSString stringWithFormat:@"text=%@, position=%ld, choicePosition=%@", _text, (long) _position,
                                      NSStringFromCGRect(_choicePosition)];
}

@end

@implementation BlankFillingData

- (NSString *)description {
    return [NSString stringWithFormat:@"text=%@, position=%ld, blankFillingPosition=%@", _text, (long) _position,
                                      NSStringFromCGRect(_blankFillingPosition)];
}

@end

@implementation HighlightData

- (NSString *)description {
    return [NSString stringWithFormat:@"range.location=%ld, range.lenght=%lu, color=%ld",
            (unsigned long)_range.location, (unsigned long)_range.length, (long)_colorIndex];
}

- (id)initWithDictionary:(NSDictionary *)dictionaryValue {
    self = [super init];
    if (self) {
        _range = NSRangeFromString(dictionaryValue[@"range"]);
        _colorIndex = [dictionaryValue[@"colorIndex"] integerValue];
    }
    return self;
}

- (NSDictionary *)dictionaryValue {
    return @{
        @"range": NSStringFromRange(_range),
        @"colorIndex": @(_colorIndex)
    };
}

@end

@implementation CoreTextData

- (NSString *)description {
    return [NSString stringWithFormat:@"ctFrame=%@, imageArray=%@", _ctFrame, _imageArray];
}

- (void)setCtFrame:(CTFrameRef)ctFrame {
    if (_ctFrame != ctFrame) {
        if (_ctFrame != nil) {
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)dealloc {
    if (_ctFrame != nil) {
        CFRelease(_ctFrame);
    }
}

- (CGFloat)cellHeight {
    if (_ctFrame == nil) {
        return 30;
    } else {
        return _cellHeight;
    }
}

- (CGFloat)firstLineY
{
    CGPathRef pathRef = CTFrameGetPath(_ctFrame);
    CGRect colRect = CGPathGetBoundingBox(pathRef);
    return colRect.origin.y;
}

- (CGFloat)firstLineHeight {
    CFArrayRef lines = CTFrameGetLines(_ctFrame);
    if (lines == nil) {
        return 0;
    }
    CFIndex lineCount = CFArrayGetCount(lines);
    if (lineCount <= 0) {
        return 0;
    }
    CTLineRef firstLine = CFArrayGetValueAtIndex(lines, 0);
    CGFloat ascent, descent, leading;
    CTLineGetTypographicBounds(firstLine, &ascent, &descent, &leading);
    return ascent + descent;
}

- (NSUInteger)lineCount {
    CFIndex lineCount = CFArrayGetCount(CTFrameGetLines(_ctFrame));
    return (NSUInteger) lineCount;
}


@end
