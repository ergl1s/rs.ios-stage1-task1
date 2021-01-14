#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
  NSArray* openBrackets = @[@"(", @"<", @"["];
  NSArray* closeBrackets = @[@")", @">", @"]"];
  
  NSMutableArray<NSString*>* result = [NSMutableArray arrayWithCapacity:10];
  int repeat = 0; //counter of repeats of the same open brackets

  for (int i = 0; i < [string length]; i++) {
    for(int j = 0; j < 3; j++) {
      if ([NSString stringWithFormat:@"%C", [string characterAtIndex:i]] == [NSString stringWithFormat:@"%@", [openBrackets objectAtIndex:j]]) {
        
        for (int z = i + 1; z < [string length]; z++) {
          if ([NSString stringWithFormat:@"%C", [string characterAtIndex:z]] == [NSString stringWithFormat:@"%@", [openBrackets objectAtIndex:j]]) {
            repeat++;
            continue;
          }
          if ([NSString stringWithFormat:@"%C", [string characterAtIndex:z]] == [NSString stringWithFormat:@"%@", [closeBrackets objectAtIndex:j]] && repeat != 0) {
            repeat--;
            continue;
          }
          if ([NSString stringWithFormat:@"%C", [string characterAtIndex:z]] == [NSString stringWithFormat:@"%@", [closeBrackets objectAtIndex:j]] && repeat == 0) {
            [result addObject:[string substringWithRange:NSMakeRange(i + 1, z - i - 1)]];
            break;
          }
        }
      }
    }
  }
  return result;
}
@end
