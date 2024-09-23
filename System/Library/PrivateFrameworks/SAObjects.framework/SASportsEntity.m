@implementation SASportsEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Entity");
}

+ (id)entity
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("image"), a3);
}

- (NSDictionary)images
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("images"));
}

- (void)setImages:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("images"), a3);
}

- (NSURL)largeImage
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("largeImage"));
}

- (void)setLargeImage:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("largeImage"), a3);
}

- (NSDictionary)largeImages
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("largeImages"));
}

- (void)setLargeImages:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("largeImages"), a3);
}

- (SASportsLeague)league
{
  return (SASportsLeague *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("league"));
}

- (void)setLeague:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("league"), a3);
}

- (NSURL)listImage
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("listImage"));
}

- (void)setListImage:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("listImage"), a3);
}

- (NSDictionary)listImages
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listImages"));
}

- (void)setListImages:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listImages"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAUIAppPunchOut)punchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchout"));
}

- (void)setPunchout:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchout"), a3);
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

@end
