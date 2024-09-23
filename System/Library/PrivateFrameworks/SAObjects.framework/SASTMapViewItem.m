@implementation SASTMapViewItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("MapViewItem");
}

+ (id)mapViewItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
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

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSNumber)zoomLevel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("zoomLevel"));
}

- (void)setZoomLevel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("zoomLevel"), a3);
}

@end
