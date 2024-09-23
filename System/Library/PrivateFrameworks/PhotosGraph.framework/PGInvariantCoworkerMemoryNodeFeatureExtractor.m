@implementation PGInvariantCoworkerMemoryNodeFeatureExtractor

- (PGInvariantCoworkerMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGInvariantCoworkerMemoryNodeFeatureExtractor *v14;
  objc_super v16;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D4B038];
  v4 = v18[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  +[PGGraphPersonNode coworkerOfPerson](PGGraphPersonNode, "coworkerOfPerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)PGInvariantCoworkerMemoryNodeFeatureExtractor;
  v14 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v16, sel_initWithName_featureNames_relation_labelForTargetBlock_, v4, v5, v13, &__block_literal_global_6_21118);

  return v14;
}

id __63__PGInvariantCoworkerMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E0D4B038];
}

@end
