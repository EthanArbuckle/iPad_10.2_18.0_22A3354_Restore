@implementation SATTSSpeechSynthesisStreaming

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisStreaming");
}

+ (id)speechSynthesisStreaming
{
  return objc_alloc_init((Class)a1);
}

- (NSString)streamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streamId"));
}

- (void)setStreamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streamId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
