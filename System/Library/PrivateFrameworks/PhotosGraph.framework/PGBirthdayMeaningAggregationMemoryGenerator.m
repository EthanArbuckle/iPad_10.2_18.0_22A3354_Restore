@implementation PGBirthdayMeaningAggregationMemoryGenerator

- (PGBirthdayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGBirthdayMeaningAggregationMemoryGenerator *v3;
  PGBirthdayMeaningAggregationMemoryGenerator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGBirthdayMeaningAggregationMemoryGenerator;
  v3 = -[PGMeaningAggregationMemoryGenerator initWithMemoryGenerationContext:](&v7, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    -[PGMeaningAggregationMemoryGenerator overTheYearsConfiguration](v3, "overTheYearsConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowTwoConsecutiveYears:", 0);

    -[PGMeaningAggregationMemoryGenerator setFeaturedYearConfiguration:](v4, "setFeaturedYearConfiguration:", 0);
  }
  return v4;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

+ (id)supportedMeaningLabels
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Birthday");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode birthdayPersonInMoment](PGGraphMomentNode, "birthdayPersonInMoment");
}

@end
