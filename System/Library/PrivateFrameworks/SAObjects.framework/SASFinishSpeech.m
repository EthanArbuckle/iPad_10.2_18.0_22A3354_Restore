@implementation SASFinishSpeech

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("FinishSpeech");
}

+ (id)finishSpeech
{
  return objc_alloc_init((Class)a1);
}

- (NSString)endpoint
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endpoint"));
}

- (void)setEndpoint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endpoint"), a3);
}

- (NSArray)featuresAtEndpoint
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("featuresAtEndpoint"));
}

- (void)setFeaturesAtEndpoint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("featuresAtEndpoint"), a3);
}

- (NSArray)orderedContext
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("orderedContext"));
}

- (void)setOrderedContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("orderedContext"), a3);
}

- (int64_t)packetCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("packetCount"));
}

- (void)setPacketCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("packetCount"), a3);
}

- (NSDictionary)serverFeatureLatencyDistribution
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serverFeatureLatencyDistribution"));
}

- (void)setServerFeatureLatencyDistribution:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serverFeatureLatencyDistribution"), a3);
}

- (double)totalAudioRecorded
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("totalAudioRecorded"));
}

- (void)setTotalAudioRecorded:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("totalAudioRecorded"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
