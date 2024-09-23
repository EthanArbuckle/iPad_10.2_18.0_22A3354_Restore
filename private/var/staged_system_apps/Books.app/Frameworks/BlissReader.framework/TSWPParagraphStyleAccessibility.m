@implementation TSWPParagraphStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPParagraphStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSSStyleAccessibility, a2);
}

@end
