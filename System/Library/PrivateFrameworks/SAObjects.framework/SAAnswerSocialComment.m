@implementation SAAnswerSocialComment

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SocialComment");
}

+ (id)socialComment
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

- (NSDate)date
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("date"));
}

- (void)setDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("date"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
