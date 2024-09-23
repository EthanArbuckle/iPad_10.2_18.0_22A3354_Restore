@implementation SAPhoneHangUpResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("HangUpResponse");
}

+ (id)hangUpResponse
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)activeCallRemaining
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("activeCallRemaining"));
}

- (void)setActiveCallRemaining:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("activeCallRemaining"), a3);
}

- (NSString)phoneHangUpCallType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneHangUpCallType"));
}

- (void)setPhoneHangUpCallType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneHangUpCallType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
