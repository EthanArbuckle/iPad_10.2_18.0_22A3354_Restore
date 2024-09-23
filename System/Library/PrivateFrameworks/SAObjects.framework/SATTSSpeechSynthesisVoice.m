@implementation SATTSSpeechSynthesisVoice

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisVoice");
}

+ (id)speechSynthesisVoice
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contentVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentVersion"));
}

- (void)setContentVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentVersion"), a3);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)keyString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyString"));
}

- (void)setKeyString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyString"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSString)quality
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("quality"));
}

- (void)setQuality:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("quality"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

- (BOOL)useServer
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("useServer"));
}

- (void)setUseServer:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("useServer"), a3);
}

@end
