@implementation TSADocumentViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)loadApplicationToolbar
{
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSADocumentViewControllerAccessibility;
  -[TSADocumentViewControllerAccessibility loadApplicationToolbar](&v5, "loadApplicationToolbar");
  objc_msgSend(-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("toolsButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("tools")));
  objc_msgSend(-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("insertButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("insert")));
  objc_msgSend(-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("inspectorButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("inspector")));
  objc_msgSend(-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("readModeButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("readmode")));
  objc_msgSend(-[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("sharingButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("share.button.label")));
  v3 = -[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("coachingTipsButton"));
  objc_msgSend(v3, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("coaching.tips.button.label")));
  objc_msgSend(v3, "setAccessibilityHint:", TSAccessibilityLocalizedString((uint64_t)CFSTR("coaching.tips.button.help.iOS")));
  v4 = -[TSADocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rightApplicationToolbarItems"));
  if (objc_msgSend(v4, "count") == (char *)&dword_0 + 1)
    objc_msgSend(objc_msgSend(v4, "lastObject"), "setAccessibilityLabel:", CFSTR("Debug menu"));
}

@end
