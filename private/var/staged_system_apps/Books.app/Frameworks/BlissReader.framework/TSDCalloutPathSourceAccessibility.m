@implementation TSDCalloutPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCalloutPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  if (-[TSDCalloutPathSourceAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isTailAtCenter")))return TSAccessibilityLocalizedString((uint64_t)CFSTR("RoundQuoteBubble"));
  else
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("BoxQuoteBubble"));
}

@end
