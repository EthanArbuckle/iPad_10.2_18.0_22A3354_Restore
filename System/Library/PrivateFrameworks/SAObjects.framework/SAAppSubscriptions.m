@implementation SAAppSubscriptions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AppSubscriptions");
}

+ (id)appSubscriptions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)activeSubscriptions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("activeSubscriptions"), v3);
}

- (void)setActiveSubscriptions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("activeSubscriptions"), (uint64_t)a3);
}

@end
