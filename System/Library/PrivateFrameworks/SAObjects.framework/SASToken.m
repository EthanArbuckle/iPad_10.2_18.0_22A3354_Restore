@implementation SASToken

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("Token");
}

+ (id)token
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)addSpaceAfter
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("addSpaceAfter"));
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("addSpaceAfter"), a3);
}

- (NSNumber)confidenceScore
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confidenceScore"));
}

- (void)setConfidenceScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confidenceScore"), a3);
}

- (NSNumber)endTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endTime"));
}

- (void)setEndTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endTime"), a3);
}

- (NSString)ipaPhoneSequence
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ipaPhoneSequence"));
}

- (void)setIpaPhoneSequence:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ipaPhoneSequence"), a3);
}

- (NSString)originalText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalText"));
}

- (void)setOriginalText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalText"), a3);
}

- (NSString)phoneSequence
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneSequence"));
}

- (void)setPhoneSequence:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneSequence"), a3);
}

- (NSString)recognitionStability
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recognitionStability"));
}

- (void)setRecognitionStability:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recognitionStability"), a3);
}

- (BOOL)removeSpaceAfter
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("removeSpaceAfter"));
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("removeSpaceAfter"), a3);
}

- (BOOL)removeSpaceBefore
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("removeSpaceBefore"));
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("removeSpaceBefore"), a3);
}

- (NSNumber)silenceStartTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("silenceStartTime"));
}

- (void)setSilenceStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("silenceStartTime"), a3);
}

- (NSNumber)startTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startTime"));
}

- (void)setStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startTime"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
