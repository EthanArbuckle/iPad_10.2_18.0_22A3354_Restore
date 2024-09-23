@implementation SAUITemplateCollectionViewCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("CollectionViewCell");
}

+ (id)collectionViewCell
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)monogramName
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("monogramName"));
}

- (void)setMonogramName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("monogramName"), a3);
}

- (BOOL)sizeToFitImage
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("sizeToFitImage"));
}

- (void)setSizeToFitImage:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("sizeToFitImage"), a3);
}

- (NSString)subtitleText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitleText"));
}

- (void)setSubtitleText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitleText"), a3);
}

- (NSArray)themeImages
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("themeImages"), v3);
}

- (void)setThemeImages:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("themeImages"), (uint64_t)a3);
}

- (NSString)titleText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("titleText"));
}

- (void)setTitleText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("titleText"), a3);
}

@end
