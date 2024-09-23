@implementation SASExtractSpeechData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ExtractSpeechData");
}

+ (id)extractSpeechData
{
  return objc_alloc_init((Class)a1);
}

- (NSString)audioOutputType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioOutputType"));
}

- (void)setAudioOutputType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioOutputType"), a3);
}

- (NSNumber)endTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endTime"));
}

- (void)setEndTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endTime"), a3);
}

- (NSString)speechRequestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechRequestId"));
}

- (void)setSpeechRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechRequestId"), a3);
}

- (NSNumber)startTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startTime"));
}

- (void)setStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startTime"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
