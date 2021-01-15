#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
  NSMutableString* copy = [NSMutableString stringWithString:s];
  NSInteger mid = [n intValue] / 2;
  
  NSMutableArray<NSNumber*>* arrayOfEqualities = [NSMutableArray arrayWithArray:@[]];
  
  for (NSInteger i = 0; i < mid; i++) {
    if ([copy characterAtIndex:i] != [copy characterAtIndex:[n integerValue] - i - 1]) {
      [arrayOfEqualities addObject: [NSNumber numberWithInteger:i]];
    }
  }
  
  NSInteger numberOfInequalities = [arrayOfEqualities count];
  if (numberOfInequalities == 0) {
    return @"It's palindrom!";
  }
  NSInteger countOfChanges = [k integerValue];
  if (numberOfInequalities > countOfChanges) {
    return @"-1";
  };
  NSInteger cycleIndex = 0;
  
  // if > +1 everthing replace by 9
  // if > only needed replace by 9
  // if == only needed
  
  while (countOfChanges > 0) {
    NSInteger indexLeft = [[arrayOfEqualities objectAtIndex:0] integerValue];
    NSInteger indexRight = [n integerValue] - [[arrayOfEqualities objectAtIndex:0] integerValue] - 1;
    
    NSInteger leftNumber = [[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexLeft]] intValue];
    NSInteger rightNumber = [[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexRight]] intValue];
    
    if (countOfChanges > numberOfInequalities + 1) {
      if ([[NSString stringWithFormat:@"%C", [copy characterAtIndex:cycleIndex]] intValue] != 9) {
        [copy replaceCharactersInRange:NSMakeRange(cycleIndex, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        if([[NSString stringWithFormat:@"%C", [copy characterAtIndex:[n integerValue] - 1 - cycleIndex]] intValue] != 9) {
          countOfChanges -= 2;
          [copy replaceCharactersInRange:NSMakeRange([n integerValue] - 1 - cycleIndex, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        } else {
          countOfChanges -= 1;
        }
        
        if(cycleIndex == indexLeft && numberOfInequalities > 0) {
          numberOfInequalities -= 1;
          [arrayOfEqualities removeObjectAtIndex:0];
        }
      }
    } else if (countOfChanges > numberOfInequalities) {
      if ([[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexLeft]] intValue] != 9 && [[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexRight]] intValue] != 9) {
        [copy replaceCharactersInRange:NSMakeRange(indexLeft, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        [copy replaceCharactersInRange:NSMakeRange(indexRight, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        countOfChanges -= 2;
      } else if ([[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexLeft]] intValue] == 9) {
        [copy replaceCharactersInRange:NSMakeRange(indexRight, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        countOfChanges -= 1;
      } else {
        [copy replaceCharactersInRange:NSMakeRange(indexLeft, 1) withString:[NSString stringWithFormat:@"%d", 9]];
        countOfChanges -= 1;
      }
      [arrayOfEqualities removeObjectAtIndex:0];
      numberOfInequalities -= 1;
    } else {
      if(leftNumber < rightNumber) {
        [copy replaceCharactersInRange:NSMakeRange(indexLeft, 1) withString:[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexRight]]];
      } else {
        [copy replaceCharactersInRange:NSMakeRange(indexRight, 1) withString:[NSString stringWithFormat:@"%C", [copy characterAtIndex:indexLeft]]];
      }
      countOfChanges -= 1;
      numberOfInequalities -= 1;
      [arrayOfEqualities removeObjectAtIndex:0];
    };
    
    if ([n integerValue] % 2 != 0 && countOfChanges == 1 && numberOfInequalities == 0) {
      [copy replaceCharactersInRange:NSMakeRange(mid, 1) withString:[NSString stringWithFormat:@"%d", 9]];
      break;
    };
    cycleIndex += 1;
  }
  return copy;
}

@end
