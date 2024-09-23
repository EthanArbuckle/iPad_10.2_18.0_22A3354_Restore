@implementation PGInvariantFamilyFeatureExtractor

- (PGInvariantFamilyFeatureExtractor)initWithError:(id *)a3
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
  PGInvariantFamilyFeatureExtractor *v13;
  objc_super v15;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D4B040];
  v4 = v17[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  +[PGGraphPersonNode familyOfPerson](PGGraphPersonNode, "familyOfPerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)PGInvariantFamilyFeatureExtractor;
  v13 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v15, sel_initWithName_featureNames_relation_labelForTargetBlock_, v4, v5, v12, &__block_literal_global_21032);

  return v13;
}

id __51__PGInvariantFamilyFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E0D4B040];
}

@end
