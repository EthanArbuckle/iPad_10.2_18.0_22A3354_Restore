@implementation SALCMContent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("Content");
}

+ (id)content
{
  return objc_alloc_init((Class)a1);
}

- (NSString)canonicalId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("canonicalId"));
}

- (void)setCanonicalId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("canonicalId"), a3);
}

- (NSString)channelId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("channelId"));
}

- (void)setChannelId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("channelId"), a3);
}

- (NSURL)externalId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("externalId"));
}

- (void)setExternalId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("externalId"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
