@implementation PGBabyFeatureExtractor

- (PGBabyFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGBabyFeatureExtractor *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("Baby");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  +[PGGraphPersonNode filterForAgeCategories:includingMe:](PGGraphPersonNode, "filterForAgeCategories:includingMe:", &unk_1E84E9568, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGBabyFeatureExtractor;
  v11 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v13, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Baby"), v4, v10, &__block_literal_global_2301);

  return v11;
}

const __CFString *__40__PGBabyFeatureExtractor_initWithError___block_invoke()
{
  return CFSTR("Baby");
}

@end
