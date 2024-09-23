@implementation SAMicroblogMicroblogSearchResultPost

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("MicroblogSearchResultPost");
}

+ (id)microblogSearchResultPost
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)creationTime
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("creationTime"));
}

- (void)setCreationTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("creationTime"), a3);
}

- (SADecoratedString)decoratedContent
{
  return (SADecoratedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedContent"));
}

- (void)setDecoratedContent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedContent"), a3);
}

- (NSArray)embeddedHashtags
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("embeddedHashtags"));
}

- (void)setEmbeddedHashtags:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("embeddedHashtags"), a3);
}

- (NSArray)embeddedImages
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("embeddedImages"), v3);
}

- (void)setEmbeddedImages:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("embeddedImages"), (uint64_t)a3);
}

- (NSArray)embeddedLinks
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("embeddedLinks"));
}

- (void)setEmbeddedLinks:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("embeddedLinks"), a3);
}

- (NSArray)embeddedMentions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("embeddedMentions"));
}

- (void)setEmbeddedMentions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("embeddedMentions"), a3);
}

- (int64_t)favoritesCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("favoritesCount"));
}

- (void)setFavoritesCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("favoritesCount"), a3);
}

- (NSString)location
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (SAMicroblogTwitterPostAuthor)retweetAuthor
{
  return (SAMicroblogTwitterPostAuthor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("retweetAuthor"));
}

- (void)setRetweetAuthor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("retweetAuthor"), a3);
}

- (int64_t)retweetCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("retweetCount"));
}

- (void)setRetweetCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("retweetCount"), a3);
}

- (NSURL)webAddress
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("webAddress"));
}

- (void)setWebAddress:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("webAddress"), a3);
}

@end
