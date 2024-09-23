@implementation PGFeaturedTimePeriodMemoryConfigurationBuilder

- (id)featuredTimePeriodMemoryConfiguration
{
  PGFeaturedTimePeriodMemoryConfiguration *v3;

  v3 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v3, "setMinimumNumberOfMoments:", -[PGOverTimeMemoryConfigurationBuilder minimumNumberOfMoments](self, "minimumNumberOfMoments"));
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMomentsInterestingWithAlternateJunking:](v3, "setMinimumNumberOfMomentsInterestingWithAlternateJunking:", -[PGOverTimeMemoryConfigurationBuilder minimumNumberOfMomentsInterestingWithAlternateJunking](self, "minimumNumberOfMomentsInterestingWithAlternateJunking"));
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMomentsInterestingForMemories:](v3, "setMinimumNumberOfMomentsInterestingForMemories:", -[PGOverTimeMemoryConfigurationBuilder minimumNumberOfMomentsInterestingForMemories](self, "minimumNumberOfMomentsInterestingForMemories"));
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v3, "setMinimumNumberOfAssetsInExtendedCuration:", -[PGOverTimeMemoryConfigurationBuilder minimumNumberOfAssetsInExtendedCuration](self, "minimumNumberOfAssetsInExtendedCuration"));
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v3, "setMinimumNumberOfRelevantAssets:", -[PGOverTimeMemoryConfigurationBuilder minimumNumberOfRelevantAssets](self, "minimumNumberOfRelevantAssets"));
  -[PGOverTimeMemoryConfigurationBuilder aboveMomentAverageContentScoreThreshold](self, "aboveMomentAverageContentScoreThreshold");
  -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v3, "setAboveMomentAverageContentScoreThreshold:");
  -[PGOverTimeMemoryConfigurationBuilder minimumOverallTimeIntervalOfMoments](self, "minimumOverallTimeIntervalOfMoments");
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v3, "setMinimumOverallTimeIntervalOfMoments:");
  -[PGOverTimeMemoryConfigurationBuilder minimumMomentSpreadicityTimeInterval](self, "minimumMomentSpreadicityTimeInterval");
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v3, "setMinimumMomentSpreadicityTimeInterval:");
  -[PGOverTimeMemoryConfiguration setAllMomentsMustHaveScenesProcessed:](v3, "setAllMomentsMustHaveScenesProcessed:", -[PGOverTimeMemoryConfigurationBuilder allMomentsMustHaveScenesProcessed](self, "allMomentsMustHaveScenesProcessed"));
  -[PGOverTimeMemoryConfiguration setAllMomentsMustHaveFacesProcessed:](v3, "setAllMomentsMustHaveFacesProcessed:", -[PGOverTimeMemoryConfigurationBuilder allMomentsMustHaveFacesProcessed](self, "allMomentsMustHaveFacesProcessed"));
  return v3;
}

@end
