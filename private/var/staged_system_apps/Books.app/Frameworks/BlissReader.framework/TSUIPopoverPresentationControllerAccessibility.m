@implementation TSUIPopoverPresentationControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIPopoverPresentationController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  Class v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUIPopoverPresentationControllerAccessibility;
  -[TSUIPopoverPresentationControllerAccessibility presentationTransitionDidEnd:](&v9, "presentationTransitionDidEnd:", a3);
  v4 = objc_msgSend(-[TSUIPopoverPresentationControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("presentedViewController")), "tsaxValueForKey:", CFSTR("view"));
  if (objc_msgSend(v4, "tsaxValueForKey:", CFSTR("window")))
  {
    v5 = objc_msgSend(v4, "tsaxValueForKey:", CFSTR("_accessibleSubviews"));
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if (objc_msgSend(v5, "count"))
      {
        v7 = objc_msgSend(objc_msgSend(v5, "sortedArrayUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:"))), "firstObject");
        v8 = NSClassFromString(CFSTR("_UIRemoteView"));
        if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
          -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", v7);
      }
    }
  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end
