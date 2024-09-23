@implementation SASportsNewsItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("NewsItem");
}

+ (id)newsItem
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("link"));
}

- (void)setLink:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("link"), a3);
}

- (NSString)summary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("summary"));
}

- (void)setSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("summary"), a3);
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
