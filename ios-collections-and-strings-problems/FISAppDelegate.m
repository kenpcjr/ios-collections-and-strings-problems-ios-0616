//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSString *lineToPrint = @"I think this works";
    NSString *frameTopAndBottom = @"";
    NSString *formattedLine = @"";
    NSMutableString *wordBlock = [@"" mutableCopy];
    NSArray *wordsToPrintArray = [lineToPrint componentsSeparatedByString:@" "];
    NSUInteger frameWidth = [[wordsToPrintArray valueForKeyPath:@"@max.length"]unsignedIntegerValue] + 1;
    
    for (NSUInteger i = 0; i <= frameWidth + 2; i++) {
        frameTopAndBottom = [frameTopAndBottom stringByAppendingString:@"*"];
    }
    for (NSUInteger i = 0; i < wordsToPrintArray.count; i++) {
        NSString *wordToPad = wordsToPrintArray[i];
        wordToPad = [wordToPad stringByPaddingToLength:frameWidth withString:@" " startingAtIndex:0];
        
        formattedLine = [NSString stringWithFormat:@"* %@*\n",wordToPad];
        [wordBlock appendString:formattedLine];
    }
    NSString *frameWithText = [NSString stringWithFormat:@"\n%@\n%@%@",frameTopAndBottom, wordBlock, frameTopAndBottom];
    
    NSLog(@"%@",frameWithText);
    
    return YES;
}

@end
