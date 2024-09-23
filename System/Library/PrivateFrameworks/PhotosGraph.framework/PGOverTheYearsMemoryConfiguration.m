@implementation PGOverTheYearsMemoryConfiguration

- (unint64_t)minimumNumberOfYears
{
  return self->_minimumNumberOfYears;
}

- (void)setMinimumNumberOfYears:(unint64_t)a3
{
  self->_minimumNumberOfYears = a3;
}

- (BOOL)allowTwoConsecutiveYears
{
  return self->_allowTwoConsecutiveYears;
}

- (void)setAllowTwoConsecutiveYears:(BOOL)a3
{
  self->_allowTwoConsecutiveYears = a3;
}

- (unint64_t)minimumNumberOfMomentsForTwoConsecutiveYears
{
  return self->_minimumNumberOfMomentsForTwoConsecutiveYears;
}

- (void)setMinimumNumberOfMomentsForTwoConsecutiveYears:(unint64_t)a3
{
  self->_minimumNumberOfMomentsForTwoConsecutiveYears = a3;
}

+ (id)defaultOverTheYearsMemoryConfiguration
{
  PGOverTheYearsMemoryConfiguration *v2;

  v2 = objc_alloc_init(PGOverTheYearsMemoryConfiguration);
  -[PGOverTheYearsMemoryConfiguration setMinimumNumberOfYears:](v2, "setMinimumNumberOfYears:", 3);
  -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v2, "setMinimumNumberOfMoments:", 3);
  -[PGOverTheYearsMemoryConfiguration setAllowTwoConsecutiveYears:](v2, "setAllowTwoConsecutiveYears:", 1);
  -[PGOverTheYearsMemoryConfiguration setMinimumNumberOfMomentsForTwoConsecutiveYears:](v2, "setMinimumNumberOfMomentsForTwoConsecutiveYears:", 4);
  -[PGOverTimeMemoryConfiguration setMinimumOverallTimeIntervalOfMoments:](v2, "setMinimumOverallTimeIntervalOfMoments:", 47336400.0);
  -[PGOverTimeMemoryConfiguration setMinimumMomentSpreadicityTimeInterval:](v2, "setMinimumMomentSpreadicityTimeInterval:", 1814400.0);
  return v2;
}

+ (id)strictDefaultOverTheYearsMemoryConfiguration
{
  void *v2;

  +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultOverTheYearsMemoryConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimumNumberOfMoments:", 4);
  objc_msgSend(v2, "setMinimumNumberOfMomentsForTwoConsecutiveYears:", 5);
  return v2;
}

+ (id)defaultFallbackOverTheYearsMemoryConfiguration
{
  void *v2;

  +[PGOverTheYearsMemoryConfiguration defaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "defaultOverTheYearsMemoryConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimumNumberOfYears:", 3);
  objc_msgSend(v2, "setMinimumNumberOfMomentsForTwoConsecutiveYears:", 3);
  objc_msgSend(v2, "setMinimumMomentSpreadicityTimeInterval:", 1209600.0);
  objc_msgSend(v2, "setMinimumNumberOfRelevantAssets:", 13);
  return v2;
}

@end
