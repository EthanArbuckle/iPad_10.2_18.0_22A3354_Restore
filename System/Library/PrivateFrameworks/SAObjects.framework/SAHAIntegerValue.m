@implementation SAHAIntegerValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("IntegerValue");
}

+ (id)integerValue
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)value
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("value"), a3);
}

@end
