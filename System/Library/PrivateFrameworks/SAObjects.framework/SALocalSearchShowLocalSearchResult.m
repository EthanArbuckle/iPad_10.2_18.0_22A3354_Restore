@implementation SALocalSearchShowLocalSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ShowLocalSearchResult");
}

+ (id)showLocalSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)extSessionGuid
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("extSessionGuid"));
}

- (void)setExtSessionGuid:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("extSessionGuid"), a3);
}

- (NSDate)extSessionGuidCreatedTimestamp
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("extSessionGuidCreatedTimestamp"));
}

- (void)setExtSessionGuidCreatedTimestamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("extSessionGuidCreatedTimestamp"), a3);
}

- (NSData)rawData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rawData"));
}

- (void)setRawData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rawData"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
