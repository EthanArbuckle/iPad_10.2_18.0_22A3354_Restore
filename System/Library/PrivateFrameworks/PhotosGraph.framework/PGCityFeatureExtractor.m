@implementation PGCityFeatureExtractor

- (PGCityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  PGCityFeatureExtractor *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCityFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  +[PGGraphAddressNode cityOfAddress](PGGraphAddressNode, "cityOfAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chain:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = 3221225472;
  v17[2] = __48__PGCityFeatureExtractor_initWithVersion_error___block_invoke;
  v17[3] = &unk_1E842DAE8;
  v18 = v6;
  v16.receiver = self;
  v16.super_class = (Class)PGCityFeatureExtractor;
  v17[0] = MEMORY[0x1E0C809B0];
  v13 = v6;
  v14 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v16, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("City"), v7, v12, v17);

  return v14;
}

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84E9CE8;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

id __48__PGCityFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCityFeatureExtractor unlocalizedCityNameFromCityName:countryCode:fromCityManager:](PGCityFeatureExtractor, "unlocalizedCityNameFromCityName:countryCode:fromCityManager:", v8, v7, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unlocalizedCityNameFromCityName:(id)a3 countryCode:(id)a4 fromCityManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    objc_msgSend(v9, "citiesMatchingName:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (objc_msgSend(v11, "unlocalizedName"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "length"),
          v12,
          v13))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "unlocalizedName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@"), v15, v8);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = &stru_1E8436F28;
    }

  }
  else
  {
    v16 = &stru_1E8436F28;
  }

  return v16;
}

@end
