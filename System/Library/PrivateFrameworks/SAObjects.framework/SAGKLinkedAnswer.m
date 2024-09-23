@implementation SAGKLinkedAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("LinkedAnswer");
}

+ (id)linkedAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSString)descriptionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("descriptionText"));
}

- (void)setDescriptionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("descriptionText"), a3);
}

- (NSString)displayLink
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayLink"));
}

- (void)setDisplayLink:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayLink"), a3);
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("link"));
}

- (void)setLink:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("link"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (NSURL)searchUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("searchUri"));
}

- (void)setSearchUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("searchUri"), a3);
}

- (NSArray)thumbnails
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("thumbnails"), v3);
}

- (void)setThumbnails:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("thumbnails"), (uint64_t)a3);
}

@end
