@implementation SAAIStartSession

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("StartSession");
}

+ (id)startSession
{
  return objc_alloc_init((Class)a1);
}

- (NSString)acousticIdSessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("acousticIdSessionId"));
}

- (void)setAcousticIdSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("acousticIdSessionId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
