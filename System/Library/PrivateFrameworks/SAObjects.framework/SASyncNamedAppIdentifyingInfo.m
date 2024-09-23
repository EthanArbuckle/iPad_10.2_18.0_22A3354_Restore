@implementation SASyncNamedAppIdentifyingInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("NamedAppIdentifyingInfo");
}

+ (id)namedAppIdentifyingInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSString)localizedBundleDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localizedBundleDisplayName"));
}

- (void)setLocalizedBundleDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localizedBundleDisplayName"), a3);
}

@end
