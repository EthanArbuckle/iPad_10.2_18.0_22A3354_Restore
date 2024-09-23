@implementation THTSDImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDImageRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDImageRepAccessibility, a2);
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THTSDImageRepAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("TSDImageRepAccessibility"));
}

- (BOOL)tsaxActivate
{
  return 0;
}

- (BOOL)thaxIsElementIgnored
{
  return -[NSString length](-[TSDImageRepAccessibility tsaxLabel](self, "tsaxLabel"), "length") == 0;
}

- (BOOL)isAccessibilityElement
{
  return !-[THTSDImageRepAccessibility thaxIsElementIgnored](self, "thaxIsElementIgnored");
}

@end
