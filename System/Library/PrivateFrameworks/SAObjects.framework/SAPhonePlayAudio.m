@implementation SAPhonePlayAudio

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("PlayAudio");
}

+ (id)playAudio
{
  return objc_alloc_init((Class)a1);
}

- (NSString)phoneAudioType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneAudioType"));
}

- (void)setPhoneAudioType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneAudioType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
