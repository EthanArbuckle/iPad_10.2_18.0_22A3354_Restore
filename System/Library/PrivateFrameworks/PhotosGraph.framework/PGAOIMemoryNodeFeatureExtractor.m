@implementation PGAOIMemoryNodeFeatureExtractor

- (PGAOIMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGAOIMemoryNodeFeatureExtractor *v10;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Disney");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphAreaNode filter](PGGraphAreaNode, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)PGAOIMemoryNodeFeatureExtractor;
  v10 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v12, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("AOI"), v4, v9, &__block_literal_global_56904);

  return v10;
}

- (PGAOIMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  return -[PGAOIMemoryNodeFeatureExtractor initWithError:](self, "initWithError:", a4);
}

uint64_t __49__PGAOIMemoryNodeFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

@end
