@implementation PGCelebratedHolidayFeatureExtractor

- (PGCelebratedHolidayFeatureExtractor)initWithError:(id *)a3
{
  return -[PGCelebratedHolidayFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGCelebratedHolidayFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  PGCelebratedHolidayFeatureExtractor *v7;
  objc_super v9;

  -[PGCelebratedHolidayFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode celebratedHolidayOfMoment](PGGraphMomentNode, "celebratedHolidayOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGCelebratedHolidayFeatureExtractor;
  v7 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v9, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("CelebratedHoliday"), v5, v6, &__block_literal_global_49142);

  return v7;
}

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84EA378;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

uint64_t __61__PGCelebratedHolidayFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

@end
