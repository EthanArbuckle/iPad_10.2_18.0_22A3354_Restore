@implementation AXUIViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  unsigned int v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXUIViewAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EscapableWindow"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXUIViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_viewDelegate")));
    if ((objc_opt_respondsToSelector(v5, "dismissPopoverAnimated:") & 1) != 0)
    {
      objc_msgSend(v5, "dismissPopoverAnimated:", 0);

      return 1;
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)AXUIViewAccessibility;
  return -[AXUIViewAccessibility accessibilityPerformEscape](&v7, "accessibilityPerformEscape");
}

- (BOOL)_accessibilityEscape
{
  return -[AXUIViewAccessibility _accessibilityEscape](self, "_accessibilityEscape");
}

- (BOOL)_accessibilityReadAllOnFocus
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXUIViewAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PreviewContentView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AXUIViewAccessibility;
  return -[AXUIViewAccessibility _accessibilityReadAllOnFocus](&v6, "_accessibilityReadAllOnFocus");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXUIViewAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EscapableWindow"));

  if (v4)
    return -[AXUIViewAccessibility accessibilityPerformEscape](self, "accessibilityPerformEscape");
  v6.receiver = self;
  v6.super_class = (Class)AXUIViewAccessibility;
  return -[AXUIViewAccessibility accessibilityActivate](&v6, "accessibilityActivate");
}

@end
