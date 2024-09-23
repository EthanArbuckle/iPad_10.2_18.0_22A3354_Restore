@implementation SAAnswerSpeakableAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SpeakableAnswer");
}

+ (id)speakableAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parameters"));
}

- (void)setParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parameters"), a3);
}

- (NSString)templateName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("templateName"));
}

- (void)setTemplateName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("templateName"), a3);
}

@end
