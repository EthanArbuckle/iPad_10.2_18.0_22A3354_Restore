@implementation PGMemoryMomentRequirements

- (BOOL)filterUninterestingWithAlternateJunking
{
  return self->_filterUninterestingWithAlternateJunking;
}

- (void)setFilterUninterestingWithAlternateJunking:(BOOL)a3
{
  self->_filterUninterestingWithAlternateJunking = a3;
}

- (BOOL)filterUninterestingForMemories
{
  return self->_filterUninterestingForMemories;
}

- (void)setFilterUninterestingForMemories:(BOOL)a3
{
  self->_filterUninterestingForMemories = a3;
}

- (BOOL)filterMomentsWithNotEnoughScenesProcessed
{
  return self->_filterMomentsWithNotEnoughScenesProcessed;
}

- (void)setFilterMomentsWithNotEnoughScenesProcessed:(BOOL)a3
{
  self->_filterMomentsWithNotEnoughScenesProcessed = a3;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (void)setMinimumNumberOfRelevantAssets:(unint64_t)a3
{
  self->_minimumNumberOfRelevantAssets = a3;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (void)setMinimumNumberOfAssetsInExtendedCuration:(unint64_t)a3
{
  self->_minimumNumberOfAssetsInExtendedCuration = a3;
}

- (double)aboveContentScoreThreshold
{
  return self->_aboveContentScoreThreshold;
}

- (void)setAboveContentScoreThreshold:(double)a3
{
  self->_aboveContentScoreThreshold = a3;
}

- (unint64_t)minimumNumberOfPersons
{
  return self->_minimumNumberOfPersons;
}

- (void)setMinimumNumberOfPersons:(unint64_t)a3
{
  self->_minimumNumberOfPersons = a3;
}

@end
