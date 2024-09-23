@implementation PGHolidayMeaningAggregationMemoryGenerator

- (PGHolidayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGHolidayMeaningAggregationMemoryGenerator *v3;
  PGHolidayMeaningAggregationMemoryGenerator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGHolidayMeaningAggregationMemoryGenerator;
  v3 = -[PGMeaningAggregationMemoryGenerator initWithMemoryGenerationContext:](&v10, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    -[PGHolidayMeaningAggregationMemoryGenerator momentRequirements](v3, "momentRequirements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumNumberOfAssetsInExtendedCuration:", 5);

    -[PGMeaningAggregationMemoryGenerator overTheYearsConfiguration](v4, "overTheYearsConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumNumberOfYears:", 2);

    -[PGMeaningAggregationMemoryGenerator overTheYearsConfiguration](v4, "overTheYearsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinimumNumberOfMoments:", 2);

    -[PGMeaningAggregationMemoryGenerator overTheYearsConfiguration](v4, "overTheYearsConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumNumberOfMomentsForTwoConsecutiveYears:", 2);

    -[PGMeaningAggregationMemoryGenerator setFeaturedYearConfiguration:](v4, "setFeaturedYearConfiguration:", 0);
  }
  return v4;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void)setMomentRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_momentRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

+ (id)supportedMeaningLabels
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HolidayEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode celebratedHolidayOfMoment](PGGraphMomentNode, "celebratedHolidayOfMoment");
}

@end
