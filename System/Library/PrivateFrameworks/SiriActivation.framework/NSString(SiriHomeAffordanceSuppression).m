@implementation NSString(SiriHomeAffordanceSuppression)

+ (const)stringWithSiriHomeAffordanceSuppression:()SiriHomeAffordanceSuppression
{
  const __CFString *v3;

  v3 = CFSTR("SiriHomeAffordanceSuppressionNone");
  if (a3 == 1)
    v3 = CFSTR("SiriHomeAffordanceSuppressionSuppress");
  if (a3 == 2)
    return CFSTR("SiriHomeAffordanceSuppressionInherit");
  else
    return v3;
}

@end
