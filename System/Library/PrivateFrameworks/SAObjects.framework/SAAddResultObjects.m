@implementation SAAddResultObjects

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AddResultObjects");
}

+ (id)addResultObjects
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)objects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("objects"), &unk_1EE77C568);
}

- (void)setObjects:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("objects"), (uint64_t)a3);
}

- (NSArray)resultObjects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("resultObjects"), &unk_1EE77C4D0);
}

- (void)setResultObjects:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resultObjects"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
