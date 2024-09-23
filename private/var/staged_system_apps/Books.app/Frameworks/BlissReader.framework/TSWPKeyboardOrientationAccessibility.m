@implementation TSWPKeyboardOrientationAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPKeyboardOrientation");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)contextChanged
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPKeyboardOrientationAccessibility;
  -[TSWPKeyboardOrientationAccessibility contextChanged](&v2, "contextChanged");
  UIAccessibilityPostNotification(TSAccessibilityFirstResponderChangedNotification, 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPKeyboardOrientationAccessibility;
  -[TSWPKeyboardOrientationAccessibility viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(-[TSWPKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mDeleteButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("delete.button")));
  objc_msgSend(-[TSWPKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMoveRightButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("move.right.button")));
  objc_msgSend(-[TSWPKeyboardOrientationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mMoveDownButton")), "setAccessibilityLabel:", CFSTR("return.button"));
}

@end
