@implementation SANPVideoLanguageOption

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying.video");
}

- (id)encodedClassName
{
  return CFSTR("LanguageOption");
}

+ (id)languageOption
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)characteristics
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("characteristics"));
}

- (void)setCharacteristics:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("characteristics"), a3);
}

- (NSString)displayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayName"));
}

- (void)setDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayName"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (NSString)languageTag
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageTag"));
}

- (void)setLanguageTag:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageTag"), a3);
}

@end
