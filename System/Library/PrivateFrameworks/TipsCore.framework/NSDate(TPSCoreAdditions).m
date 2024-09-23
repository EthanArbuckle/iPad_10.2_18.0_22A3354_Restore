@implementation NSDate(TPSCoreAdditions)

+ (BOOL)isDateExpired:()TPSCoreAdditions maxTimeInterval:
{
  double v5;

  if (!a4)
    return 0;
  objc_msgSend(a4, "timeIntervalSinceNow");
  return v5 < a1;
}

- (BOOL)isTimeToDate:()TPSCoreAdditions withinTimeInterval:
{
  double v5;

  if (!a4)
    return 0;
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return v5 > a2;
}

@end
