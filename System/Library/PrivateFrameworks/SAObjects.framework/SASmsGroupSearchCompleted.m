@implementation SASmsGroupSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("GroupSearchCompleted");
}

+ (id)groupSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)smsGroups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("smsGroups"), v3);
}

- (void)setSmsGroups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("smsGroups"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
