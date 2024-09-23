@implementation SAUIRevealRecognizedSpeech

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("RevealRecognizedSpeech");
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)speechRecognizedAceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechRecognizedAceId"));
}

- (void)setSpeechRecognizedAceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechRecognizedAceId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
