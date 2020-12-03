#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    int sumOfItemsWithoutAnna = 0;
   
    int counter = 0;
    for (NSNumber* item in bill) {
        if (counter != index) {
            sumOfItemsWithoutAnna += [item intValue];
        };
        counter++;
    }
    
    int result = 0;
    int eachHasToPay = sumOfItemsWithoutAnna / 2;
    if (eachHasToPay < [sum intValue]) {
        result = [sum intValue] - eachHasToPay;
    }
    
    if (result == 0)
        return @"Bon Appetit";
    else
        return [NSString stringWithFormat:@"%i", result];
}

@end
