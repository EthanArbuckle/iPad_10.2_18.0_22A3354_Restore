@implementation SASVSpeechMetadata

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("SpeechMetadata");
}

+ (id)speechMetadata
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)phraseDataList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("phraseDataList"), v3);
}

- (void)setPhraseDataList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("phraseDataList"), (uint64_t)a3);
}

- (NSString)preITN
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preITN"));
}

- (void)setPreITN:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preITN"), a3);
}

@end
