@implementation TSAViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSAViewControllerAccessibility;
  v4 = -[TSAViewControllerAccessibility toolbarButtonItemForCoachingTipsWithTarget:action:](&v6, "toolbarButtonItemForCoachingTipsWithTarget:action:", a3, a4);
  objc_msgSend(v4, "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("coaching.tips.button.label")));
  objc_msgSend(v4, "setAccessibilityHint:", TSAccessibilityLocalizedString((uint64_t)CFSTR("coaching.tips.button.help.iOS")));
  return v4;
}

@end
