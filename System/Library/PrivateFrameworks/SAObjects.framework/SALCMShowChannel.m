@implementation SALCMShowChannel

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("ShowChannel");
}

+ (id)showChannel
{
  return objc_alloc_init((Class)a1);
}

- (SALCMTvChannel)channel
{
  return (SALCMTvChannel *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("channel"));
}

- (void)setChannel:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("channel"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
