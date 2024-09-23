@implementation SADataSourceInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DataSourceInfo");
}

- (NSString)contextIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contextIdentifier"));
}

- (void)setContextIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contextIdentifier"), a3);
}

- (NSString)proximityHint
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("proximityHint"));
}

- (void)setProximityHint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("proximityHint"), a3);
}

- (NSString)sourceDeviceOwnership
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sourceDeviceOwnership"));
}

- (void)setSourceDeviceOwnership:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sourceDeviceOwnership"), a3);
}

@end
