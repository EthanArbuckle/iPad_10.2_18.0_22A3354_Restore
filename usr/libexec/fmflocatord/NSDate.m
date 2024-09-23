@implementation NSDate

- (id)stringValueForServer
{
  __CFDateFormatter *v3;
  CFTimeZoneRef v4;
  __CFString *StringWithDate;

  v3 = CFDateFormatterCreate(kCFAllocatorDefault, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  v4 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFDateFormatterSetProperty(v3, kCFDateFormatterTimeZone, v4);
  CFDateFormatterSetFormat(v3, CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
  if (v4)
    CFRelease(v4);
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(kCFAllocatorDefault, v3, (CFDateRef)self);
  if (v3)
    CFRelease(v3);
  return StringWithDate;
}

@end
