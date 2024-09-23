@implementation SAPhoneAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("Answer");
}

+ (id)answer
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)videoAllowed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("videoAllowed"));
}

- (void)setVideoAllowed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("videoAllowed"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
