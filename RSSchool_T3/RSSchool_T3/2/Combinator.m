#import "Combinator.h"


/*
 Чтобы решить эту задачу нам надо найти k, наше k - это то что мы используем в формуле сочетаний из n по k ( результат нам уже известен - это количество постеров ).
 */


@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    if (array[1].intValue == array[0].intValue) { return @1;
    } else {
        int m_enter_value = array[0].intValue;
        int n_enter_value = array[1].intValue;
        
        for (int i = 1; i < n_enter_value; i++) {
        
            double dbl_first = 1;
            for (int i = 1; i <= n_enter_value; i++) {
                 dbl_first = dbl_first * i;
            }
            
            double dbl_second = 1;
            for (int j = 1; j <= n_enter_value - i; j++) {
                 dbl_second = dbl_second * j;
            }
            
            double dbl_third = 1;
            for (int j = 1; j <= i; j++) {
                 dbl_third = dbl_third * j;
            }
        
            double k = dbl_first/(dbl_second * dbl_third);

            if (k >= m_enter_value) {
                NSNumber* result = [NSNumber numberWithInt:i];
                return result;
            }
        }
    }
    return nil;
}

@end
