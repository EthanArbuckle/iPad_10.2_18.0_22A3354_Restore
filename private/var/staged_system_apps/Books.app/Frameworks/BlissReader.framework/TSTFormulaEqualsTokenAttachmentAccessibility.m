@implementation TSTFormulaEqualsTokenAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTFormulaEqualsTokenAttachment");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPAttachmentAccessibility, a2);
}

- (NSString)tsaxStringRepresentation
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.equals.token.title"));
}

@end
