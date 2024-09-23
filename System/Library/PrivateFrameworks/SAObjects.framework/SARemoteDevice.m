@implementation SARemoteDevice

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RemoteDevice");
}

+ (id)remoteDevice
{
  return objc_alloc_init((Class)a1);
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (NSString)brandName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("brandName"));
}

- (void)setBrandName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("brandName"), a3);
}

- (NSString)deviceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceName"));
}

- (void)setDeviceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceName"), a3);
}

- (NSString)discoveryMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("discoveryMode"));
}

- (void)setDiscoveryMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("discoveryMode"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)personalDomainsAuthenticationMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("personalDomainsAuthenticationMode"));
}

- (void)setPersonalDomainsAuthenticationMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("personalDomainsAuthenticationMode"), a3);
}

- (NSNumber)personalDomainsEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("personalDomainsEnabled"));
}

- (void)setPersonalDomainsEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("personalDomainsEnabled"), a3);
}

- (BOOL)siriEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("siriEnabled"));
}

- (void)setSiriEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("siriEnabled"), a3);
}

- (NSString)userAgent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userAgent"));
}

- (void)setUserAgent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userAgent"), a3);
}

@end
