@implementation SARDRunNLXRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("RunNLXRequest");
}

- (SASRecognition)asrOutput
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("asrOutput"));
}

- (void)setAsrOutput:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("asrOutput"), a3);
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("processedAudioDuration"));
}

- (void)setProcessedAudioDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("processedAudioDuration"), a3);
}

- (NSString)userId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userId"));
}

- (void)setUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
