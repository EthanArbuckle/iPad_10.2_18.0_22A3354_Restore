@implementation SASetContextConfiguration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetContextConfiguration");
}

+ (id)setContextConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)contextTimeoutSeconds
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("contextTimeoutSeconds"));
}

- (void)setContextTimeoutSeconds:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("contextTimeoutSeconds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
