@implementation SAHAFloatValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("FloatValue");
}

+ (id)floatValue
{
  return objc_alloc_init((Class)a1);
}

- (float)value
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("value"), a3);
}

@end
