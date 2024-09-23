@implementation TSAToolsChooserViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAToolsChooserViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)didSelectImageAtIndex:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAToolsChooserViewControllerAccessibility;
  -[TSAToolsChooserViewControllerAccessibility didSelectImageAtIndex:](&v3, "didSelectImageAtIndex:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

@end
