@implementation SAPhoneCallState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallState");
}

+ (id)callState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)active
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("active"));
}

- (void)setActive:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("active"), a3);
}

- (BOOL)incoming
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("incoming"));
}

- (void)setIncoming:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("incoming"), a3);
}

@end
