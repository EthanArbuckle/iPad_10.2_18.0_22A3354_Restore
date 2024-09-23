@implementation SATTSSpeechSynthesisResource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisResource");
}

+ (id)speechSynthesisResource
{
  return objc_alloc_init((Class)a1);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (NSString)resourceVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resourceVersion"));
}

- (void)setResourceVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resourceVersion"), a3);
}

@end
