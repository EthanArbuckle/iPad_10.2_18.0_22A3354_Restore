@implementation SAUIChangePrimaryUtterance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ChangePrimaryUtterance");
}

+ (id)changePrimaryUtterance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)speechRecognitionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechRecognitionId"));
}

- (void)setSpeechRecognitionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechRecognitionId"), a3);
}

- (int64_t)utteranceIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("utteranceIndex"));
}

- (void)setUtteranceIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("utteranceIndex"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
