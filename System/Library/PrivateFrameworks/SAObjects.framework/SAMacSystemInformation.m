@implementation SAMacSystemInformation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.mac");
}

- (id)encodedClassName
{
  return CFSTR("SystemInformation");
}

+ (id)systemInformation
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

@end
