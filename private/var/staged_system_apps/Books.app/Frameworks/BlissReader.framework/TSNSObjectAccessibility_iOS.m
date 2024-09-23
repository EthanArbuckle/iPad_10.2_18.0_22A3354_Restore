@implementation TSNSObjectAccessibility_iOS

+ (id)tsaxTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSNSObjectAccessibility_iOS;
  -[TSNSObjectAccessibility_iOS accessibilityElementDidBecomeFocused](&v3, "accessibilityElementDidBecomeFocused");
  -[TSAccessibility _setCurrentlyFocusedElement:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_setCurrentlyFocusedElement:", self);
}

- (void)accessibilityElementDidLoseFocus
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSNSObjectAccessibility_iOS;
  -[TSNSObjectAccessibility_iOS accessibilityElementDidLoseFocus](&v2, "accessibilityElementDidLoseFocus");
  -[TSAccessibility _setCurrentlyFocusedElement:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_setCurrentlyFocusedElement:", 0);
}

- (BOOL)_accessibilityServesAsFirstElement
{
  objc_super v4;

  if (-[TSAccessibility _firstElementForUpcomingScreenChange](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_firstElementForUpcomingScreenChange") == self)return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSNSObjectAccessibility_iOS;
  return -[TSNSObjectAccessibility_iOS _accessibilityServesAsFirstElement](&v4, "_accessibilityServesAsFirstElement");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSNSObjectAccessibility_iOS;
  -[TSNSObjectAccessibility_iOS _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[TSNSObjectAccessibility_iOS tsaxLoadAccessibilityInformation](self, "tsaxLoadAccessibilityInformation");
}

@end
