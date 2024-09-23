@implementation THToolbarAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THToolbar");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("toolbar"));
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  return 1;
}

@end
