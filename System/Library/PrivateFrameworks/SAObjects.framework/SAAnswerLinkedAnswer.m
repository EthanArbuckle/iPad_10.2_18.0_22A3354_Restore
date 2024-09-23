@implementation SAAnswerLinkedAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
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

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("image"), a3);
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

@end
