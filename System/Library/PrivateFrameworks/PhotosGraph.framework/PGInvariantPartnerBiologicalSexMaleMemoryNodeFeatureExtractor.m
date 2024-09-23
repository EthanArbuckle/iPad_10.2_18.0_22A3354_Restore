@implementation PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor

- (PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  void *v3;
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
  void *v15;
  PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor *v16;
  objc_super v19;
  _QWORD v20[4];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor, "name", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  +[PGGraphPersonNode filterForBiologicalSex:](PGGraphPersonNode, "filterForBiologicalSex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  +[PGGraphPersonNode partnerOfPerson](PGGraphPersonNode, "partnerOfPerson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor;
  v16 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v19, sel_initWithName_featureNames_relation_labelForTargetBlock_, v15, v4, v14, &__block_literal_global_27_41334);

  return v16;
}

id __79__PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor, "name");
}

+ (id)name
{
  return +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor labelProcessingForLabel:sex:](PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor, "labelProcessingForLabel:sex:", *MEMORY[0x1E0D4B048], 2);
}

+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), a3, a4);
}

@end
