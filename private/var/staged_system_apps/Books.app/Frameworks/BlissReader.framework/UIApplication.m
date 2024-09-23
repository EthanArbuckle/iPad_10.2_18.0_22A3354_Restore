@implementation UIApplication

- (void)accessibilityInitialize
{
  -[TSAccessibility loadAccessibilitySupport](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "loadAccessibilitySupport");
}

@end
