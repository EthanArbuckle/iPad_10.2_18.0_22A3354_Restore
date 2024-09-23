@implementation SALocalSearchPhoto

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Photo");
}

+ (id)photo
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)fullsize
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("fullsize"));
}

- (void)setFullsize:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("fullsize"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (NSURL)largeSize
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("largeSize"));
}

- (void)setLargeSize:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("largeSize"), a3);
}

- (NSURL)maximumSize
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("maximumSize"));
}

- (void)setMaximumSize:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("maximumSize"), a3);
}

- (SAUIAppPunchOut)photoPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("photoPunchOut"));
}

- (void)setPhotoPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("photoPunchOut"), a3);
}

- (NSURL)thumbnail
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("thumbnail"));
}

- (void)setThumbnail:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("thumbnail"), a3);
}

@end
