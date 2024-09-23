@implementation TSADocumentManagerRenameDocTextFieldAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerRenameDocTextField");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("rename.text.field"));
}

@end
