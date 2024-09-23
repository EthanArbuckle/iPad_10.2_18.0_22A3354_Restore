@implementation SAResultSelected

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ResultSelected");
}

- (NSNumber)isMitigated
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isMitigated"));
}

- (void)setIsMitigated:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isMitigated"), a3);
}

+ (id)resultSelected
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("processedAudioDuration"));
}

- (void)setProcessedAudioDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("processedAudioDuration"), a3);
}

- (NSString)resultId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultId"));
}

- (void)setResultId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
