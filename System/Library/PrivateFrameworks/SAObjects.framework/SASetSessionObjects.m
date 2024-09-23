@implementation SASetSessionObjects

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetSessionObjects");
}

+ (id)setSessionObjects
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)objects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("objects"), &unk_1EE782740);
}

- (void)setObjects:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("objects"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
