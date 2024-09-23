@implementation SAAnswerObjectLine

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("ObjectLine");
}

+ (id)objectLine
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

- (NSNumber)imageInverted
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageInverted"));
}

- (void)setImageInverted:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageInverted"), a3);
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
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
