@implementation THWAdornmentCloseButtonAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAdornmentCloseButton");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("close.button"));
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("fullscreen.view.close.button.hint.ios"));
}

@end
