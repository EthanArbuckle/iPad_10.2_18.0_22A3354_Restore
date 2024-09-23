@implementation SALocalSearchRangePeriod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("RangePeriod");
}

+ (id)rangePeriod
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)endSecondsSinceMidnight
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("endSecondsSinceMidnight"));
}

- (void)setEndSecondsSinceMidnight:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("endSecondsSinceMidnight"), a3);
}

- (int64_t)startSecondsSinceMidnight
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("startSecondsSinceMidnight"));
}

- (void)setStartSecondsSinceMidnight:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("startSecondsSinceMidnight"), a3);
}

@end
