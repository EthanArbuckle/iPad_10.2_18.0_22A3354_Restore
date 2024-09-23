@implementation PGInvariantDaughterFeatureExtractor

- (PGInvariantDaughterFeatureExtractor)initWithError:(id *)a3
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
  PGInvariantDaughterFeatureExtractor *v13;
  objc_super v15;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("DAUGHTER");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  +[PGGraphPersonNode daughterOfPerson](PGGraphPersonNode, "daughterOfPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inverse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)PGInvariantDaughterFeatureExtractor;
  v13 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v15, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("DAUGHTER"), v4, v12, &__block_literal_global_38389);

  return v13;
}

const __CFString *__53__PGInvariantDaughterFeatureExtractor_initWithError___block_invoke()
{
  __CFString *v0;

  v0 = CFSTR("DAUGHTER");
  return CFSTR("DAUGHTER");
}

@end
