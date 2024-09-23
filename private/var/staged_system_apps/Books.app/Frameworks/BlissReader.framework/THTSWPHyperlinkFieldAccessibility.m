@implementation THTSWPHyperlinkFieldAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPHyperlinkField");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPHyperlinkFieldAccessibility, a2);
}

@end
