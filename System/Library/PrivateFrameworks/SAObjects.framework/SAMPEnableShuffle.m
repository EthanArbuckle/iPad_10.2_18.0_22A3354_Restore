@implementation SAMPEnableShuffle

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("EnableShuffle");
}

+ (id)enableShuffle
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)enable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enable"));
}

- (void)setEnable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enable"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
