#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSNumber* max = [array valueForKeyPath:@"@max.self"];
    NSNumber* min = [array valueForKeyPath:@"@min.self"];

    NSMutableArray<NSNumber*>* result = [NSMutableArray arrayWithCapacity:2];

    NSInteger sum = 0;
    for (NSNumber *num in array) {
     sum += [num intValue];
    }

    [result addObject:@(sum - [max intValue])];
    [result addObject:@(sum - [min intValue])];

    return result;
}

@end
