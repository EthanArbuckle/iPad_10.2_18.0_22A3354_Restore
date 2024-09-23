@implementation SAiCloudGetiCloudInformation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.iCloud");
}

- (id)encodedClassName
{
  return CFSTR("GetiCloudInformation");
}

+ (id)getiCloudInformation
{
  return objc_alloc_init((Class)a1);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
