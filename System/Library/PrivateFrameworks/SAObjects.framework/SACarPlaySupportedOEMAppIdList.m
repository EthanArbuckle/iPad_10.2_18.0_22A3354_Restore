@implementation SACarPlaySupportedOEMAppIdList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CarPlaySupportedOEMAppIdList");
}

+ (id)carPlaySupportedOEMAppIdList
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appIds"));
}

- (void)setAppIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appIds"), a3);
}

@end
