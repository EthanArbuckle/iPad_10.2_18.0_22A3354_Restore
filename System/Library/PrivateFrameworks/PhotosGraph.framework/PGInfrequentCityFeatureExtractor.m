@implementation PGInfrequentCityFeatureExtractor

- (PGInfrequentCityFeatureExtractor)initWithError:(id *)a3
{
  return -[PGInfrequentCityFeatureExtractor initWithVersion:graph:error:](self, "initWithVersion:graph:error:", 1, 0, a3);
}

- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  PGInfrequentCityFeatureExtractor *v14;

  v10 = (void *)MEMORY[0x1E0CFA978];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PGInfrequentCityFeatureExtractor initWithFrequentCityLabels:version:graph:cityManager:error:](self, "initWithFrequentCityLabels:version:graph:cityManager:error:", v12, a4, v11, v13, a6);

  return v14;
}

- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 cityManager:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  PGInfrequentCityFeatureExtractor *v20;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  -[PGInfrequentCityFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  +[PGGraphAddressNode cityOfAddress](PGGraphAddressNode, "cityOfAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chain:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = 3221225472;
  v23[2] = __95__PGInfrequentCityFeatureExtractor_initWithFrequentCityLabels_version_graph_cityManager_error___block_invoke;
  v23[3] = &unk_1E8432FE0;
  v24 = v11;
  v25 = v10;
  v22.receiver = self;
  v22.super_class = (Class)PGInfrequentCityFeatureExtractor;
  v23[0] = MEMORY[0x1E0C809B0];
  v18 = v10;
  v19 = v11;
  v20 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v22, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("City"), v12, v17, v23);

  return v20;
}

- (PGInfrequentCityFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  PGInfrequentCityFeatureExtractor *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addressNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cityNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __64__PGInfrequentCityFeatureExtractor_initWithVersion_graph_error___block_invoke;
      v22 = &unk_1E8433008;
      v23 = v10;
      v15 = v14;
      v24 = v15;
      objc_msgSend(v13, "enumerateNodesUsingBlock:", &v19);
      v16 = v15;

      v9 = v16;
    }

  }
  v17 = -[PGInfrequentCityFeatureExtractor initWithFrequentCityLabels:version:graph:cityManager:error:](self, "initWithFrequentCityLabels:version:graph:cityManager:error:", v9, a3, v8, v10, a5, v19, v20, v21, v22);

  return v17;
}

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_1E84EA510;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

void __64__PGInfrequentCityFeatureExtractor_initWithVersion_graph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCityFeatureExtractor unlocalizedCityNameFromCityName:countryCode:fromCityManager:](PGCityFeatureExtractor, "unlocalizedCityNameFromCityName:countryCode:fromCityManager:", v7, v9, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

id __95__PGInfrequentCityFeatureExtractor_initWithFrequentCityLabels_version_graph_cityManager_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

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

  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

@end
