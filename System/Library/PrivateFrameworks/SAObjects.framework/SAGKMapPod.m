@implementation SAGKMapPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("MapPod");
}

+ (id)mapPod
{
  return objc_alloc_init((Class)a1);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (NSNumber)showButton
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("showButton"));
}

- (void)setShowButton:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("showButton"), a3);
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
