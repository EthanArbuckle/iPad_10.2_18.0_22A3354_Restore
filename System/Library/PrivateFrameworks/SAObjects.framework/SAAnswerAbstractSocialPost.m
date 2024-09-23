@implementation SAAnswerAbstractSocialPost

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("AbstractSocialPost");
}

+ (id)abstractSocialPost
{
  return objc_alloc_init((Class)a1);
}

- (NSString)author
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("author"));
}

- (void)setAuthor:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("author"), a3);
}

- (NSString)authorTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("authorTitle"));
}

- (void)setAuthorTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("authorTitle"), a3);
}

- (NSArray)comments
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("comments"), v3);
}

- (void)setComments:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("comments"), (uint64_t)a3);
}

- (NSDate)dateCreated
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateCreated"));
}

- (void)setDateCreated:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateCreated"), a3);
}

- (NSDate)dateModified
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateModified"));
}

- (void)setDateModified:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateModified"), a3);
}

- (NSURL)icon
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("icon"));
}

- (void)setIcon:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("icon"), a3);
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("rank"));
}

- (void)setRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("rank"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
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
