@implementation SAGlance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Glance");
}

+ (id)glance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appId"));
}

- (void)setAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appId"), a3);
}

- (NSString)glanceDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("glanceDisplayName"));
}

- (void)setGlanceDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("glanceDisplayName"), a3);
}

- (NSString)glanceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("glanceId"));
}

- (void)setGlanceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("glanceId"), a3);
}

- (NSDictionary)localizedGlanceDisplayNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localizedGlanceDisplayNameMap"));
}

- (void)setLocalizedGlanceDisplayNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localizedGlanceDisplayNameMap"), a3);
}

@end
