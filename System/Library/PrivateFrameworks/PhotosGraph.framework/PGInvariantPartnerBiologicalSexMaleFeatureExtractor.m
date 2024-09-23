@implementation PGInvariantPartnerBiologicalSexMaleFeatureExtractor

- (PGInvariantPartnerBiologicalSexMaleFeatureExtractor)initWithError:(id *)a3
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
  void *v15;
  PGInvariantPartnerBiologicalSexMaleFeatureExtractor *v16;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  +[PGInvariantPartnerBiologicalSexMaleFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleFeatureExtractor, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  +[PGGraphPersonNode filterForBiologicalSex:](PGGraphPersonNode, "filterForBiologicalSex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  +[PGGraphPersonNode partnerOfPerson](PGGraphPersonNode, "partnerOfPerson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chain:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGInvariantPartnerBiologicalSexMaleFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleFeatureExtractor, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PGInvariantPartnerBiologicalSexMaleFeatureExtractor;
  v16 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v18, sel_initWithName_featureNames_relation_labelForTargetBlock_, v15, v5, v14, &__block_literal_global_10);

  return v16;
}

id __69__PGInvariantPartnerBiologicalSexMaleFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerBiologicalSexMaleFeatureExtractor name](PGInvariantPartnerBiologicalSexMaleFeatureExtractor, "name");
}

+ (id)name
{
  return +[PGInvariantPartnerBiologicalSexMaleFeatureExtractor labelProcessingForLabel:sex:](PGInvariantPartnerBiologicalSexMaleFeatureExtractor, "labelProcessingForLabel:sex:", *MEMORY[0x1E0D4B048], 2);
}

+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), a3, a4);
}

@end
