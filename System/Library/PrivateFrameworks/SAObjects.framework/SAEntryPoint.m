@implementation SAEntryPoint

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("EntryPoint");
}

+ (id)entryPoint
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)latitude
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latitude"));
}

- (void)setLatitude:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latitude"), a3);
}

- (NSNumber)longitude
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("longitude"));
}

- (void)setLongitude:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("longitude"), a3);
}

@end
