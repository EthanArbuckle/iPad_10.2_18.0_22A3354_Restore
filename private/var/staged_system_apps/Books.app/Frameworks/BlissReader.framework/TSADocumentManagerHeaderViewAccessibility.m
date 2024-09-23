@implementation TSADocumentManagerHeaderViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerHeaderView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
