@implementation RTVisitHyperParameter

- (double)maxGapInVisit
{
  return self->_maxGapInVisit;
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (unint64_t)movingWindowSizeForSpeed
{
  return self->_movingWindowSizeForSpeed;
}

- (double)minSpeedToFilter
{
  return self->_minSpeedToFilter;
}

- (unint64_t)maxDistanceBetweenAdjacentPoints
{
  return self->_maxDistanceBetweenAdjacentPoints;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)maxBurstNoiseLength
{
  return self->_maxBurstNoiseLength;
}

- (double)maxNonFlankDistance
{
  return self->_maxNonFlankDistance;
}

- (double)minNoiseToLeftFlankDistance
{
  return self->_minNoiseToLeftFlankDistance;
}

- (unint64_t)smootherKernelWidth
{
  return self->_smootherKernelWidth;
}

- (unint64_t)timeIntervalBetweenSmoothedPoints
{
  return self->_timeIntervalBetweenSmoothedPoints;
}

- (unint64_t)completeVisitMargin
{
  return self->_completeVisitMargin;
}

- (double)decoderEntryCost
{
  return self->_decoderEntryCost;
}

- (double)decoderExitCost
{
  return self->_decoderExitCost;
}

- (unint64_t)featureDimension
{
  return self->_featureDimension;
}

- (double)featureDistanceMax
{
  return self->_featureDistanceMax;
}

- (double)featureDistanceMin
{
  return self->_featureDistanceMin;
}

- (double)featureDwellnessLogMax
{
  return self->_featureDwellnessLogMax;
}

- (double)featureDwellnessLogMin
{
  return self->_featureDwellnessLogMin;
}

- (unint64_t)featurePaddingValue
{
  return self->_featurePaddingValue;
}

- (double)featureRadiusMax
{
  return self->_featureRadiusMax;
}

- (double)featureRadiusMin
{
  return self->_featureRadiusMin;
}

- (unint64_t)maxSequenceLength
{
  return self->_maxSequenceLength;
}

- (double)minEntryProbability
{
  return self->_minEntryProbability;
}

- (double)minExitProbability
{
  return self->_minExitProbability;
}

- (unint64_t)minInferenceInterval
{
  return self->_minInferenceInterval;
}

- (double)minNoVisitProbability
{
  return self->_minNoVisitProbability;
}

- (unint64_t)minSequenceLength
{
  return self->_minSequenceLength;
}

- (unint64_t)noVisitMargin
{
  return self->_noVisitMargin;
}

- (unint64_t)numOfSlide
{
  return self->_numOfSlide;
}

- (unint64_t)numOfTimeStepForDistance
{
  return self->_numOfTimeStepForDistance;
}

- (unint64_t)numOfTimeStepForDwellness
{
  return self->_numOfTimeStepForDwellness;
}

- (unint64_t)numOfTimeStepForRadius
{
  return self->_numOfTimeStepForRadius;
}

- (unint64_t)numTargetClass
{
  return self->_numTargetClass;
}

- (unint64_t)onDeviceInferenceBatchSize
{
  return self->_onDeviceInferenceBatchSize;
}

- (unint64_t)partialVisitMargin
{
  return self->_partialVisitMargin;
}

- (unint64_t)referenceSize
{
  return self->_referenceSize;
}

- (unint64_t)stride
{
  return self->_stride;
}

- (unint64_t)timeStepInterval
{
  return self->_timeStepInterval;
}

- (unint64_t)visitInferenceResolution
{
  return self->_visitInferenceResolution;
}

- (unint64_t)windowInterval
{
  return self->_windowInterval;
}

- (unint64_t)windowSize
{
  return self->_windowSize;
}

- (unint64_t)binSize
{
  return self->_binSize;
}

- (unint64_t)maxNumOfBins
{
  return self->_maxNumOfBins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
