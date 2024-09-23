@implementation SASSpeechCorrectionStatistics

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechCorrectionStatistics");
}

+ (id)speechCorrectionStatistics
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)alternativeSelectCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("alternativeSelectCount"));
}

- (void)setAlternativeSelectCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("alternativeSelectCount"), a3);
}

- (int64_t)characterChangeCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("characterChangeCount"));
}

- (void)setCharacterChangeCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("characterChangeCount"), a3);
}

- (NSString)correctionSource
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("correctionSource"));
}

- (void)setCorrectionSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("correctionSource"), a3);
}

- (NSString)correctionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("correctionText"));
}

- (void)setCorrectionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("correctionText"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
