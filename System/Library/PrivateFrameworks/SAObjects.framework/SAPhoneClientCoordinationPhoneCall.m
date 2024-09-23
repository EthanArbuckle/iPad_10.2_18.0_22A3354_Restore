@implementation SAPhoneClientCoordinationPhoneCall

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("ClientCoordinationPhoneCall");
}

+ (id)clientCoordinationPhoneCall
{
  return objc_alloc_init((Class)a1);
}

- (SAPersonAttribute)callRecipient
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("callRecipient"));
}

- (void)setCallRecipient:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("callRecipient"), a3);
}

- (BOOL)emergencyCall
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("emergencyCall"));
}

- (void)setEmergencyCall:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("emergencyCall"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
