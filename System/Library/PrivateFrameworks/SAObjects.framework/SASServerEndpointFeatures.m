@implementation SASServerEndpointFeatures

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ServerEndpointFeatures");
}

+ (id)serverEndpointFeatures
{
  return objc_alloc_init((Class)a1);
}

- (double)eosLikelihood
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("eosLikelihood"));
}

- (void)setEosLikelihood:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("eosLikelihood"), a3);
}

- (int64_t)numOfWords
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("numOfWords"));
}

- (void)setNumOfWords:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("numOfWords"), a3);
}

- (NSArray)pauseCounts
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pauseCounts"));
}

- (void)setPauseCounts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pauseCounts"), a3);
}

- (int64_t)processedAudioDurationMs
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("processedAudioDurationMs"));
}

- (void)setProcessedAudioDurationMs:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("processedAudioDurationMs"), a3);
}

- (double)silenceProbability
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("silenceProbability"));
}

- (void)setSilenceProbability:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("silenceProbability"), a3);
}

- (NSString)taskName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskName"));
}

- (void)setTaskName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskName"), a3);
}

- (int64_t)trailingSilenceDuration
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("trailingSilenceDuration"));
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("trailingSilenceDuration"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
