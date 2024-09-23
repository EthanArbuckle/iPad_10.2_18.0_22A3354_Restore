@implementation PGCountryFeatureExtractor

- (PGCountryFeatureExtractor)initWithError:(id *)a3
{
  return -[PGCountryFeatureExtractor initWithVersion:graph:error:](self, "initWithVersion:graph:error:", 1, 0, a3);
}

- (PGCountryFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGCountryFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  +[PGGraphAddressNode countryOfAddress](PGGraphAddressNode, "countryOfAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PGCountryFeatureExtractor;
  v12 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Country"), v6, v11, &__block_literal_global_39972);

  return v12;
}

uint64_t __57__PGCountryFeatureExtractor_initWithVersion_graph_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

+ (id)_labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84EA0C0;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

@end
