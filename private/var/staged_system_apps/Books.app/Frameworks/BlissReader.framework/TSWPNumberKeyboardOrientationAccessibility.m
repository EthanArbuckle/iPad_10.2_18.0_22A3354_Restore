@implementation TSWPNumberKeyboardOrientationAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPNumberKeyboardOrientation");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPNumberKeyboardOrientationAccessibility;
  -[TSWPNumberKeyboardOrientationAccessibility viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mStarsButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("stars.rating.button")));
  objc_msgSend(-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mNegativeButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("plus.or.minus.button")));
  objc_msgSend(-[TSWPNumberKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mBooleanButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("checkbox.creator.button")));
}

@end
