@implementation TSWPFootnoteReferenceAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPFootnoteReferenceAttachment");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPAttachmentAccessibility, a2);
}

- (unint64_t)tsaxFootnoteIndex
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_5439B3);
}

- (void)tsaxSetFootnoteIndex:(unint64_t)a3
{
  __TSAccessibilitySetAssociatedUnsignedInteger(self, &unk_5439B3, (id)a3);
}

@end
