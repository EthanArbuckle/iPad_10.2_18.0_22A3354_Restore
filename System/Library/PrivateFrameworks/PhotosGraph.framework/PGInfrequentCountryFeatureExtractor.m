@implementation PGInfrequentCountryFeatureExtractor

- (PGInfrequentCountryFeatureExtractor)initWithError:(id *)a3
{
  return -[PGInfrequentCountryFeatureExtractor initWithVersion:graph:error:](self, "initWithVersion:graph:error:", 1, 0, a3);
}

- (PGInfrequentCountryFeatureExtractor)initWithFrequentCountryLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PGInfrequentCountryFeatureExtractor *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  +[PGGraphAddressNode countryOfAddress](PGGraphAddressNode, "countryOfAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chain:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = 3221225472;
  v19[2] = __89__PGInfrequentCountryFeatureExtractor_initWithFrequentCountryLabels_version_graph_error___block_invoke;
  v19[3] = &unk_1E8428F40;
  v20 = v8;
  v18.receiver = self;
  v18.super_class = (Class)PGInfrequentCountryFeatureExtractor;
  v19[0] = MEMORY[0x1E0C809B0];
  v15 = v8;
  v16 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v18, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Country"), v9, v14, v19);

  return v16;
}

- (PGInfrequentCountryFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PGInfrequentCountryFeatureExtractor *v17;

  v8 = a4;
  if (v8)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addressNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "countryNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "names");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
      v13 = v12;
    else
      v13 = (id)MEMORY[0x1E0C9AA60];
    +[PGInfrequentCountryFeatureExtractor inferredUserLanguageCodesFromGraph:](PGInfrequentCountryFeatureExtractor, "inferredUserLanguageCodesFromGraph:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v15;
    }

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGInfrequentCountryFeatureExtractor initWithFrequentCountryLabels:version:graph:error:](self, "initWithFrequentCountryLabels:version:graph:error:", v16, a3, v8, a5);

  return v17;
}

id __89__PGInfrequentCountryFeatureExtractor_initWithFrequentCountryLabels_version_graph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)inferredUserLanguageCodesFromGraph:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "inferredUserLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "languageCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uppercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84E9700;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

@end
