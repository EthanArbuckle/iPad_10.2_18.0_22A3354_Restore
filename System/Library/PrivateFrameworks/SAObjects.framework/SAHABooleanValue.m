@implementation SAHABooleanValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("BooleanValue");
}

+ (id)BOOLeanValue
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("value"), a3);
}

@end
