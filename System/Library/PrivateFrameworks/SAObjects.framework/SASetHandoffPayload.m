@implementation SASetHandoffPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetHandoffPayload");
}

+ (id)setHandoffPayload
{
  return objc_alloc_init((Class)a1);
}

- (SAHandoffPayload)handoffPayload
{
  return (SAHandoffPayload *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("handoffPayload"));
}

- (void)setHandoffPayload:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("handoffPayload"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
