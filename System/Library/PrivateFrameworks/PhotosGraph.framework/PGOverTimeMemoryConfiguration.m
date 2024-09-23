@implementation PGOverTimeMemoryConfiguration

- (unint64_t)minimumNumberOfMoments
{
  return self->_minimumNumberOfMoments;
}

- (void)setMinimumNumberOfMoments:(unint64_t)a3
{
  self->_minimumNumberOfMoments = a3;
}

- (unint64_t)minimumNumberOfMomentsInterestingWithAlternateJunking
{
  return self->_minimumNumberOfMomentsInterestingWithAlternateJunking;
}

- (void)setMinimumNumberOfMomentsInterestingWithAlternateJunking:(unint64_t)a3
{
  self->_minimumNumberOfMomentsInterestingWithAlternateJunking = a3;
}

- (unint64_t)minimumNumberOfMomentsInterestingForMemories
{
  return self->_minimumNumberOfMomentsInterestingForMemories;
}

- (void)setMinimumNumberOfMomentsInterestingForMemories:(unint64_t)a3
{
  self->_minimumNumberOfMomentsInterestingForMemories = a3;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3
{
  self->_minimumNumberOfAssetsInExtendedCuration = a3;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3
{
  self->_minimumNumberOfRelevantAssets = a3;
}

- (double)aboveMomentAverageContentScoreThreshold
{
  return self->_aboveMomentAverageContentScoreThreshold;
}

- (void)setAboveMomentAverageContentScoreThreshold:(double)a3
{
  self->_aboveMomentAverageContentScoreThreshold = a3;
}

- (double)minimumOverallTimeIntervalOfMoments
{
  return self->_minimumOverallTimeIntervalOfMoments;
}

- (void)setMinimumOverallTimeIntervalOfMoments:(double)a3
{
  self->_minimumOverallTimeIntervalOfMoments = a3;
}

- (double)minimumMomentSpreadicityTimeInterval
{
  return self->_minimumMomentSpreadicityTimeInterval;
}

- (void)setMinimumMomentSpreadicityTimeInterval:(double)a3
{
  self->_minimumMomentSpreadicityTimeInterval = a3;
}

- (BOOL)allMomentsMustHaveScenesProcessed
{
  return self->_allMomentsMustHaveScenesProcessed;
}

- (void)setAllMomentsMustHaveScenesProcessed:(BOOL)a3
{
  self->_allMomentsMustHaveScenesProcessed = a3;
}

- (BOOL)allMomentsMustHaveFacesProcessed
{
  return self->_allMomentsMustHaveFacesProcessed;
}

- (void)setAllMomentsMustHaveFacesProcessed:(BOOL)a3
{
  self->_allMomentsMustHaveFacesProcessed = a3;
}

@end
