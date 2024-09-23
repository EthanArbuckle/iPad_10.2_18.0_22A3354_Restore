@implementation PGCelebratedHolidayMemoryNodeFeatureExtractor

- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return -[PGCelebratedHolidayMemoryNodeFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGCelebratedHolidayMemoryNodeFeatureExtractor *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PGCelebratedHolidayMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphHolidayNode filter](PGGraphHolidayNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGCelebratedHolidayMemoryNodeFeatureExtractor;
  v11 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v13, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("CelebratedHoliday"), v5, v10, &__block_literal_global_378);

  return v11;
}

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84EA390;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

uint64_t __71__PGCelebratedHolidayMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

@end
