@implementation PGFeaturedTimePeriodMemoryConfiguration

+ (id)defaultFeaturedYearMemoryConfiguration
{
  PGFeaturedTimePeriodMemoryConfiguration *v2;

  v2 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v2, "setMinimumNumberOfMoments:", 4);
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v2, "setMinimumOverallTimeIntervalOfMoments:", 13149000.0);
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v2, "setMinimumMomentSpreadicityTimeInterval:", 1209600.0);
  return v2;
}

+ (id)strictDefaultFeaturedYearMemoryConfiguration
{
  void *v2;

  +[PGFeaturedTimePeriodMemoryConfiguration defaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "defaultFeaturedYearMemoryConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimumNumberOfMoments:", 5);
  return v2;
}

+ (id)defaultFallbackFeaturedYearMemoryConfiguration
{
  PGFeaturedTimePeriodMemoryConfiguration *v2;

  v2 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v2, "setMinimumNumberOfMoments:", 3);
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v2, "setMinimumOverallTimeIntervalOfMoments:", 13149000.0);
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v2, "setMinimumMomentSpreadicityTimeInterval:", 604800.0);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v2, "setMinimumNumberOfRelevantAssets:", 13);
  return v2;
}

+ (id)defaultFeaturedSeasonMemoryConfiguration
{
  PGFeaturedTimePeriodMemoryConfiguration *v2;

  v2 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v2, "setMinimumNumberOfMoments:", 5);
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v2, "setMinimumOverallTimeIntervalOfMoments:", 5259600.0);
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v2, "setMinimumMomentSpreadicityTimeInterval:", 604800.0);
  return v2;
}

@end
