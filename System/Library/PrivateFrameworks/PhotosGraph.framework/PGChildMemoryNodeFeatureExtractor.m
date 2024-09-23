@implementation PGChildMemoryNodeFeatureExtractor

- (PGChildMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGChildMemoryNodeFeatureExtractor *v10;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Child");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonNode filterForAgeCategories:includingMe:](PGGraphPersonNode, "filterForAgeCategories:includingMe:", &unk_1E84E98E0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)PGChildMemoryNodeFeatureExtractor;
  v10 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v12, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Child"), v4, v9, &__block_literal_global_161_15640);

  return v10;
}

const __CFString *__51__PGChildMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return CFSTR("Child");
}

@end
