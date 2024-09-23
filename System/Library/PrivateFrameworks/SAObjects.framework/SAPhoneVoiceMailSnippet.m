@implementation SAPhoneVoiceMailSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("VoiceMailSnippet");
}

+ (id)voiceMailSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)autoPlay
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("autoPlay"));
}

- (void)setAutoPlay:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("autoPlay"), a3);
}

- (NSArray)calls
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("calls"), v3);
}

- (void)setCalls:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("calls"), (uint64_t)a3);
}

- (NSArray)playVoiceMailCommands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("playVoiceMailCommands"), v3);
}

- (void)setPlayVoiceMailCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("playVoiceMailCommands"), (uint64_t)a3);
}

- (SAClientBoundCommand)postPlayCommand
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("postPlayCommand"));
}

- (void)setPostPlayCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("postPlayCommand"), a3);
}

@end
