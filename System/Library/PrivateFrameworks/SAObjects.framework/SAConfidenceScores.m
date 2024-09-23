@implementation SAConfidenceScores

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ConfidenceScores");
}

+ (id)confidenceScores
{
  return objc_alloc_init((Class)a1);
}

- (NSString)assetVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assetVersion"));
}

- (void)setAssetVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assetVersion"), a3);
}

- (NSString)classifiedUser
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("classifiedUser"));
}

- (void)setClassifiedUser:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("classifiedUser"), a3);
}

- (int64_t)lowScoreThreshold
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("lowScoreThreshold"));
}

- (void)setLowScoreThreshold:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("lowScoreThreshold"), a3);
}

- (int64_t)processedAudioDurationMilliseconds
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("processedAudioDurationMilliseconds"));
}

- (void)setProcessedAudioDurationMilliseconds:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("processedAudioDurationMilliseconds"), a3);
}

- (NSArray)scores
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("scores"), v3);
}

- (void)setScores:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("scores"), (uint64_t)a3);
}

- (NSNumber)scoringSchemeVersion
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("scoringSchemeVersion"));
}

- (void)setScoringSchemeVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("scoringSchemeVersion"), a3);
}

- (NSString)thresholdType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("thresholdType"));
}

- (void)setThresholdType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("thresholdType"), a3);
}

- (NSString)userIdentityClassification
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userIdentityClassification"));
}

- (void)setUserIdentityClassification:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userIdentityClassification"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
