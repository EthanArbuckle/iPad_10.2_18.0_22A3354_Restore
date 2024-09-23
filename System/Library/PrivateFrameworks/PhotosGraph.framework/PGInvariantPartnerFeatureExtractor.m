@implementation PGInvariantPartnerFeatureExtractor

- (PGInvariantPartnerFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGInvariantPartnerFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D4B048];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  +[PGGraphPersonNode partnerOfPerson](PGGraphPersonNode, "partnerOfPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  +[PGGraphMeNode filter](PGGraphMeNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PGInvariantPartnerFeatureExtractor;
  v12 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Partner"), v4, v11, &__block_literal_global_41315);

  return v12;
}

id __52__PGInvariantPartnerFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E0D4B048];
}

+ (id)name
{
  return (id)*MEMORY[0x1E0D4B048];
}

@end
