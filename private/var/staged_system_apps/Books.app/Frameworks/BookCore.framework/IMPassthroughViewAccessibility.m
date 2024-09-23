@implementation IMPassthroughViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMPassthroughView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
