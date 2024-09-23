@implementation SAPreSynthesizeTTS

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PreSynthesizeTTS");
}

+ (id)preSynthesizeTTS
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)aceAudioData
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("aceAudioData"), v3);
}

- (void)setAceAudioData:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("aceAudioData"), (uint64_t)a3);
}

- (NSArray)dialogStrings
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogStrings"));
}

- (void)setDialogStrings:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogStrings"), a3);
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableContextInfo"));
}

- (void)setSpeakableContextInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableContextInfo"), a3);
}

- (NSArray)streamIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streamIds"));
}

- (void)setStreamIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streamIds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
