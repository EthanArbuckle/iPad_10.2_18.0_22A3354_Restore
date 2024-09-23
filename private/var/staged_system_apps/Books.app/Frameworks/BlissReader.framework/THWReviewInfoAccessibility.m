@implementation THWReviewInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxLocalizedDescriptionForQuestionState:(int)a3
{
  if ((a3 - 3) > 3)
    return 0;
  else
    return THAccessibilityLocalizedString((uint64_t)off_43C850[a3 - 3]);
}

@end
