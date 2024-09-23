@implementation SASetCarPlayContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetCarPlayContext");
}

+ (id)setCarPlayContext
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)objects
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("objects"), v3);
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
