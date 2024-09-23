@implementation SAUIAcePronunciationItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AcePronunciationItem");
}

+ (id)acePronunciationItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSString)tts
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tts"));
}

- (void)setTts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tts"), a3);
}

@end
