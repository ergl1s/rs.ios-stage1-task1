#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if ([sadArray isEqual:@[]]) return sadArray;
    NSMutableArray* happyArray = [NSMutableArray arrayWithArray:sadArray];
    
    for (int i = 1; i < [happyArray count] - 1; i++) {
        if ([happyArray[i] intValue] > [happyArray[i - 1] intValue] +
            [happyArray[i + 1] intValue]) {
            [happyArray removeObjectAtIndex:i];
            i = 1;
        }
    }
    return happyArray;
}

@end
