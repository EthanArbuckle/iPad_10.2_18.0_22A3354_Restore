@implementation SAIntentGroupProfileSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ProfileSnippetTemplate");
}

+ (id)profileSnippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (NSString)alignment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alignment"));
}

- (void)setAlignment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alignment"), a3);
}

- (NSString)imageStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageStyle"));
}

- (void)setImageStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageStyle"), a3);
}

- (NSString)imageURI
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageURI"));
}

- (void)setImageURI:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageURI"), a3);
}

- (NSArray)labelComponents
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("labelComponents"), v3);
}

- (void)setLabelComponents:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("labelComponents"), (uint64_t)a3);
}

@end
