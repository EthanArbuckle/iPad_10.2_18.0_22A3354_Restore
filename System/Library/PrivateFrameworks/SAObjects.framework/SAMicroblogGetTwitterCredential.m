@implementation SAMicroblogGetTwitterCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("GetTwitterCredential");
}

+ (id)getTwitterCredential
{
  return objc_alloc_init((Class)a1);
}

- (NSString)consumerKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("consumerKey"));
}

- (void)setConsumerKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("consumerKey"), a3);
}

- (NSString)consumerSecret
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("consumerSecret"));
}

- (void)setConsumerSecret:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("consumerSecret"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
