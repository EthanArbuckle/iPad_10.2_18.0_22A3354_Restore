@implementation SASPronunciationContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("PronunciationContext");
}

+ (id)pronunciationContext
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)domainObjectIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("domainObjectIdentifier"));
}

- (void)setDomainObjectIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("domainObjectIdentifier"), a3);
}

- (NSString)domainObjectPropertyIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainObjectPropertyIdentifier"));
}

- (void)setDomainObjectPropertyIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainObjectPropertyIdentifier"), a3);
}

- (NSString)fullName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullName"));
}

- (void)setFullName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullName"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)orthography
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("orthography"));
}

- (void)setOrthography:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("orthography"), a3);
}

- (NSNumber)tokenOffset
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tokenOffset"));
}

- (void)setTokenOffset:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tokenOffset"), a3);
}

@end
