@implementation SAMicroblogMicroblogSearchResultNews

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("MicroblogSearchResultNews");
}

+ (id)microblogSearchResultNews
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)articleURL
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("articleURL"));
}

- (void)setArticleURL:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("articleURL"), a3);
}

- (NSString)descriptionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("descriptionText"));
}

- (void)setDescriptionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("descriptionText"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
