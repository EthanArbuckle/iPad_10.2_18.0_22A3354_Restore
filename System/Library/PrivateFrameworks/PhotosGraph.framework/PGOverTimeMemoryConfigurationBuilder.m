@implementation PGOverTimeMemoryConfigurationBuilder

- (unint64_t)minimumNumberOfMoments
{
  return self->_minimumNumberOfMoments;
}

- (unint64_t)minimumNumberOfMomentsInterestingWithAlternateJunking
{
  return self->_minimumNumberOfMomentsInterestingWithAlternateJunking;
}

- (unint64_t)minimumNumberOfMomentsInterestingForMemories
{
  return self->_minimumNumberOfMomentsInterestingForMemories;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (double)aboveMomentAverageContentScoreThreshold
{
  return self->_aboveMomentAverageContentScoreThreshold;
}

- (double)minimumOverallTimeIntervalOfMoments
{
  return self->_minimumOverallTimeIntervalOfMoments;
}

- (double)minimumMomentSpreadicityTimeInterval
{
  return self->_minimumMomentSpreadicityTimeInterval;
}

- (BOOL)allMomentsMustHaveScenesProcessed
{
  return self->_allMomentsMustHaveScenesProcessed;
}

- (BOOL)allMomentsMustHaveFacesProcessed
{
  return self->_allMomentsMustHaveFacesProcessed;
}

@end
