@implementation SAMorphunDataState

+ (id)deliveryDeadline
{
  return CFSTR("CUSTOM");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("MorphunDataState");
}

+ (id)morphunDataState
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)assetVersionPerLocale
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assetVersionPerLocale"));
}

- (void)setAssetVersionPerLocale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assetVersionPerLocale"), a3);
}

@end
