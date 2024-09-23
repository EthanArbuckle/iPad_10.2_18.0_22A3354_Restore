@implementation SALCMTvChannel

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("TvChannel");
}

+ (id)tvChannel
{
  return objc_alloc_init((Class)a1);
}

- (NSString)callSign
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("callSign"));
}

- (void)setCallSign:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("callSign"), a3);
}

- (NSString)channelIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("channelIdentifier"));
}

- (void)setChannelIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("channelIdentifier"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSURL)streamUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("streamUrl"));
}

- (void)setStreamUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("streamUrl"), a3);
}

@end
