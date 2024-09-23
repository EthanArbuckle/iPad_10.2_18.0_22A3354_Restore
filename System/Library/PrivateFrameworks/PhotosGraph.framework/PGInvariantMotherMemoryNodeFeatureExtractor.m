@implementation PGInvariantMotherMemoryNodeFeatureExtractor

- (PGInvariantMotherMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGInvariantMotherMemoryNodeFeatureExtractor *v14;
  objc_super v16;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("MOTHER");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  +[PGGraphPersonNode motherOfPerson](PGGraphPersonNode, "motherOfPerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inverse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)PGInvariantMotherMemoryNodeFeatureExtractor;
  v14 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v16, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("MOTHER"), v4, v13, &__block_literal_global_6_42187);

  return v14;
}

const __CFString *__61__PGInvariantMotherMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  __CFString *v0;

  v0 = CFSTR("MOTHER");
  return CFSTR("MOTHER");
}

@end
