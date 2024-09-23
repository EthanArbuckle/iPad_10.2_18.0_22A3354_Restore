@implementation NSDate(Weather)

- (double)wa_timeIntervalUntilNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return -v1;
}

@end
