@implementation SAVoice

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Voice");
}

+ (id)voice
{
  return objc_alloc_init((Class)a1);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)languageString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageString"));
}

- (void)setLanguageString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageString"), a3);
}

- (NSString)masteredVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("masteredVersion"));
}

- (void)setMasteredVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("masteredVersion"), a3);
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

- (int64_t)resourceContentVersion
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("resourceContentVersion"));
}

- (void)setResourceContentVersion:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("resourceContentVersion"), a3);
}

- (NSString)resourceMasteredVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resourceMasteredVersion"));
}

- (void)setResourceMasteredVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resourceMasteredVersion"), a3);
}

- (int64_t)voiceContentVersion
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("voiceContentVersion"));
}

- (void)setVoiceContentVersion:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("voiceContentVersion"), a3);
}

- (NSString)voiceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceType"));
}

- (void)setVoiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceType"), a3);
}

@end
