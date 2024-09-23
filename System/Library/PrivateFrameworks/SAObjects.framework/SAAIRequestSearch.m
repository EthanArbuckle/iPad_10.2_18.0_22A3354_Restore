@implementation SAAIRequestSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("RequestSearch");
}

+ (id)requestSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)acousticIdSearchSessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("acousticIdSearchSessionId"));
}

- (void)setAcousticIdSearchSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("acousticIdSearchSessionId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
