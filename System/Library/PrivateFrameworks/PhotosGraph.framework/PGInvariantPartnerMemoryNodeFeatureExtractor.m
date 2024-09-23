@implementation PGInvariantPartnerMemoryNodeFeatureExtractor

- (PGInvariantPartnerMemoryNodeFeatureExtractor)initWithError:(id *)a3
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
  void *v14;
  PGInvariantPartnerMemoryNodeFeatureExtractor *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[PGInvariantPartnerMemoryNodeFeatureExtractor name](PGInvariantPartnerMemoryNodeFeatureExtractor, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  +[PGGraphPersonNode partnerOfPerson](PGGraphPersonNode, "partnerOfPerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGInvariantPartnerMemoryNodeFeatureExtractor name](PGInvariantPartnerMemoryNodeFeatureExtractor, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PGInvariantPartnerMemoryNodeFeatureExtractor;
  v15 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v17, sel_initWithName_featureNames_relation_labelForTargetBlock_, v14, v5, v13, &__block_literal_global_23);

  return v15;
}

id __62__PGInvariantPartnerMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerMemoryNodeFeatureExtractor name](PGInvariantPartnerMemoryNodeFeatureExtractor, "name");
}

+ (id)name
{
  return (id)*MEMORY[0x1E0D4B048];
}

@end
