@implementation TSATemplateViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSATemplateViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSATemplateViewControllerAccessibility;
  -[TSATemplateViewControllerAccessibility _cancel](&v2, "_cancel");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end
