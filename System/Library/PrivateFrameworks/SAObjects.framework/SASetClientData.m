@implementation SASetClientData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetClientData");
}

+ (id)setClientData
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)holdToTalkThresholdInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("holdToTalkThresholdInMilliseconds"));
}

- (void)setHoldToTalkThresholdInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("holdToTalkThresholdInMilliseconds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
