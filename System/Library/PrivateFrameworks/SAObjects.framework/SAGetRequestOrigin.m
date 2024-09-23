@implementation SAGetRequestOrigin

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetRequestOrigin");
}

+ (id)getRequestOrigin
{
  return objc_alloc_init((Class)a1);
}

- (NSString)desiredAccuracy
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("desiredAccuracy"));
}

- (void)setDesiredAccuracy:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("desiredAccuracy"), a3);
}

- (NSNumber)maxAge
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("maxAge"));
}

- (void)setMaxAge:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("maxAge"), a3);
}

- (NSNumber)searchTimeout
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchTimeout"));
}

- (void)setSearchTimeout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchTimeout"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
