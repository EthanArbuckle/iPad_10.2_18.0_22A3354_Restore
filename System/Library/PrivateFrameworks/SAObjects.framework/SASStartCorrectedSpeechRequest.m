@implementation SASStartCorrectedSpeechRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartCorrectedSpeechRequest");
}

+ (id)startCorrectedSpeechRequest
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)combinedRank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("combinedRank"));
}

- (void)setCombinedRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("combinedRank"), a3);
}

- (double)combinedScore
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("combinedScore"));
}

- (void)setCombinedScore:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("combinedScore"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (BOOL)onDeviceUtterancesPresent
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("onDeviceUtterancesPresent"));
}

- (void)setOnDeviceUtterancesPresent:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("onDeviceUtterancesPresent"), a3);
}

- (int64_t)originalRank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("originalRank"));
}

- (void)setOriginalRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("originalRank"), a3);
}

- (double)originalScore
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("originalScore"));
}

- (void)setOriginalScore:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("originalScore"), a3);
}

- (NSString)previousUtterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previousUtterance"));
}

- (void)setPreviousUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previousUtterance"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (NSString)utteranceSource
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utteranceSource"));
}

- (void)setUtteranceSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utteranceSource"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
