@implementation PGOverTheYearsMemoryNodeFeatureExtractor

- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return -[PGOverTheYearsMemoryNodeFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGOverTheYearsMemoryNodeFeatureExtractor *v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("OverTheYears");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphOverTheYearsNode filter](PGGraphOverTheYearsNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGOverTheYearsMemoryNodeFeatureExtractor;
  v11 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v13, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("OverTheYears"), v5, v10, &__block_literal_global_31648);

  return v11;
}

uint64_t __66__PGOverTheYearsMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
