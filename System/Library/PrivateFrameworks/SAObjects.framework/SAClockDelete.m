@implementation SAClockDelete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("Delete");
}

- (NSArray)clockIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("clockIds"));
}

- (void)setClockIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("clockIds"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
