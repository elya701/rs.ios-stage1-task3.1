#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if (numbers.count == 0) { return nil; }
    int check_on_zero = false;
    unsigned long count = numbers.count;
    NSMutableString *result = [NSMutableString new];
    for (int i = 0; i < [numbers count]; i++) {
        count -= 1;
        int num = abs(numbers[i].intValue);
        if (check_on_zero == 1) { check_on_zero = 0; }
        else if (count == 0) { [result appendString:[NSString stringWithFormat:@"%d", num]];
        } else if (count > 1) {
            if (num == 1) { [result appendString:[NSString stringWithFormat:@"%@%lu", @"x^", count]];
            } else { [result appendString:[NSString stringWithFormat:@"%d%@%lu",num, @"x^", count]]; }
        } else if (count == 1) {
            if (num == 1) { [result appendString:[NSString stringWithFormat:@"%@", @"x"]];
            } else { [result appendString:[NSString stringWithFormat:@"%d%@", num, @"x"]];
            }
        }
        if (count >= 1) {
            int nextNum = numbers[i+1].intValue;
            if (nextNum <= -1){ [result appendString:[NSString stringWithFormat:@" - "]];
            } else if (nextNum >= 1) { [result appendString:[NSString stringWithFormat:@" + "]];
            } else if (nextNum == 0) { check_on_zero = 1; }
        }
    }
    return result;
}
@end
