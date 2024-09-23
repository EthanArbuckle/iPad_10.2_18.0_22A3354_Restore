@implementation SALCMGetTvSubscriptionsClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("GetTvSubscriptionsClientState");
}

+ (id)getTvSubscriptionsClientState
{
  return objc_alloc_init((Class)a1);
}

- (SALCMTvSubscriptionsClientState)clientState
{
  return (SALCMTvSubscriptionsClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
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
