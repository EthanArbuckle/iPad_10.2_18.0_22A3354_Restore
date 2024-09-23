@implementation TSDConnectionLinePathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDConnectionLinePathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("ConnectionLine"));
}

@end
