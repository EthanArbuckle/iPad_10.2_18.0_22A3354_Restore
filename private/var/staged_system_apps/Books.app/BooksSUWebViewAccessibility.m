@implementation BooksSUWebViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("SUWebView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

@end
