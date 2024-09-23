@implementation PGMemoryMomentRequirementsBuilder

- (id)memoryMomentRequirements
{
  PGMemoryMomentRequirements *v3;

  v3 = objc_alloc_init(PGMemoryMomentRequirements);
  -[PGMemoryMomentRequirements setFilterUninterestingWithAlternateJunking:](v3, "setFilterUninterestingWithAlternateJunking:", -[PGMemoryMomentRequirementsBuilder filterUninterestingWithAlternateJunking](self, "filterUninterestingWithAlternateJunking"));
  -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v3, "setFilterUninterestingForMemories:", -[PGMemoryMomentRequirementsBuilder filterUninterestingForMemories](self, "filterUninterestingForMemories"));
  -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v3, "setFilterMomentsWithNotEnoughScenesProcessed:", -[PGMemoryMomentRequirementsBuilder filterMomentsWithNotEnoughScenesProcessed](self, "filterMomentsWithNotEnoughScenesProcessed"));
  -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v3, "setMinimumNumberOfRelevantAssets:", -[PGMemoryMomentRequirementsBuilder minimumNumberOfRelevantAssets](self, "minimumNumberOfRelevantAssets"));
  -[PGMemoryMomentRequirements setMinimumNumberOfAssetsInExtendedCuration:](v3, "setMinimumNumberOfAssetsInExtendedCuration:", -[PGMemoryMomentRequirementsBuilder minimumNumberOfAssetsInExtendedCuration](self, "minimumNumberOfAssetsInExtendedCuration"));
  -[PGMemoryMomentRequirementsBuilder aboveContentScoreThreshold](self, "aboveContentScoreThreshold");
  -[PGMemoryMomentRequirements setAboveContentScoreThreshold:](v3, "setAboveContentScoreThreshold:");
  -[PGMemoryMomentRequirements setMinimumNumberOfPersons:](v3, "setMinimumNumberOfPersons:", -[PGMemoryMomentRequirementsBuilder minimumNumberOfPersons](self, "minimumNumberOfPersons"));
  return v3;
}

- (BOOL)filterUninterestingWithAlternateJunking
{
  return self->_filterUninterestingWithAlternateJunking;
}

- (BOOL)filterUninterestingForMemories
{
  return self->_filterUninterestingForMemories;
}

- (BOOL)filterMomentsWithNotEnoughScenesProcessed
{
  return self->_filterMomentsWithNotEnoughScenesProcessed;
}

- (unint64_t)minimumNumberOfRelevantAssets
{
  return self->_minimumNumberOfRelevantAssets;
}

- (unint64_t)minimumNumberOfAssetsInExtendedCuration
{
  return self->_minimumNumberOfAssetsInExtendedCuration;
}

- (double)aboveContentScoreThreshold
{
  return self->_aboveContentScoreThreshold;
}

- (unint64_t)minimumNumberOfPersons
{
  return self->_minimumNumberOfPersons;
}

@end
