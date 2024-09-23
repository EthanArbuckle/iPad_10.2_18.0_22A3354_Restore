@implementation PGROIMemoryNodeFeatureExtractor

- (PGROIMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGROIMemoryNodeFeatureExtractor *v12;
  objc_super v14;
  void *v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D4B018];
  v16[0] = *MEMORY[0x1E0D4B020];
  v16[1] = v4;
  v5 = *MEMORY[0x1E0D4B028];
  v16[2] = *MEMORY[0x1E0D4B030];
  v16[3] = v5;
  v16[4] = *MEMORY[0x1E0D4B010];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphROINode filter](PGGraphROINode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PGROIMemoryNodeFeatureExtractor;
  v12 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("ROI"), v6, v11, &__block_literal_global_40730);

  return v12;
}

uint64_t __49__PGROIMemoryNodeFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
