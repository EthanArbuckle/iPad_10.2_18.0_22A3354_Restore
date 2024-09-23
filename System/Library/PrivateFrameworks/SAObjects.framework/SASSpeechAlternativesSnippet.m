@implementation SASSpeechAlternativesSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechAlternativesSnippet");
}

+ (id)speechAlternativesSnippet
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)maxEntryToShow
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("maxEntryToShow"));
}

- (void)setMaxEntryToShow:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("maxEntryToShow"), a3);
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

@end
