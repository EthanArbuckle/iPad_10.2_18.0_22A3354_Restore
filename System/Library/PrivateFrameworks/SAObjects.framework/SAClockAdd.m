@implementation SAClockAdd

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("Add");
}

+ (id)add
{
  return objc_alloc_init((Class)a1);
}

- (SAClockObject)clockToAdd
{
  return (SAClockObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clockToAdd"));
}

- (void)setClockToAdd:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("clockToAdd"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
