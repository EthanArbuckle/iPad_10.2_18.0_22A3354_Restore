@implementation UIApplication

- (void)accessibilityInitialize
{
  -[CRLAccessibility loadAccessibilitySupport](+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"), "loadAccessibilitySupport");
}

@end
