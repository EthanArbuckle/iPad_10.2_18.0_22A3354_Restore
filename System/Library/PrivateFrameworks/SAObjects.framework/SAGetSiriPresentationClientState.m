@implementation SAGetSiriPresentationClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetSiriPresentationClientState");
}

+ (id)getSiriPresentationClientState
{
  return objc_alloc_init((Class)a1);
}

- (SASiriPresentationClientState)clientState
{
  return (SASiriPresentationClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
}

- (void)setClientState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("clientState"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
