@implementation SASResultCandidate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ResultCandidate");
}

+ (id)resultCandidate
{
  return objc_alloc_init((Class)a1);
}

- (SASRecognition)filteredRecognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("filteredRecognition"));
}

- (void)setFilteredRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("filteredRecognition"), a3);
}

- (NSNumber)latticeRnnMitigatorCalibrationOffset
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latticeRnnMitigatorCalibrationOffset"));
}

- (void)setLatticeRnnMitigatorCalibrationOffset:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latticeRnnMitigatorCalibrationOffset"), a3);
}

- (NSNumber)latticeRnnMitigatorCalibrationScale
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latticeRnnMitigatorCalibrationScale"));
}

- (void)setLatticeRnnMitigatorCalibrationScale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latticeRnnMitigatorCalibrationScale"), a3);
}

- (NSNumber)latticeRnnMitigatorIsProcessed
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latticeRnnMitigatorIsProcessed"));
}

- (void)setLatticeRnnMitigatorIsProcessed:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latticeRnnMitigatorIsProcessed"), a3);
}

- (NSString)latticeRnnMitigatorModelId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latticeRnnMitigatorModelId"));
}

- (void)setLatticeRnnMitigatorModelId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latticeRnnMitigatorModelId"), a3);
}

- (double)latticeRnnMitigatorScore
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("latticeRnnMitigatorScore"));
}

- (void)setLatticeRnnMitigatorScore:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("latticeRnnMitigatorScore"), a3);
}

- (double)latticeRnnMitigatorThreshold
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("latticeRnnMitigatorThreshold"));
}

- (void)setLatticeRnnMitigatorThreshold:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("latticeRnnMitigatorThreshold"), a3);
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("processedAudioDuration"));
}

- (void)setProcessedAudioDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("processedAudioDuration"), a3);
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)resultId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultId"));
}

- (void)setResultId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultId"), a3);
}

- (NSNumber)speechProfileUsed
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechProfileUsed"));
}

- (void)setSpeechProfileUsed:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechProfileUsed"), a3);
}

- (NSString)speechRecognitionTask
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechRecognitionTask"));
}

- (void)setSpeechRecognitionTask:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechRecognitionTask"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
