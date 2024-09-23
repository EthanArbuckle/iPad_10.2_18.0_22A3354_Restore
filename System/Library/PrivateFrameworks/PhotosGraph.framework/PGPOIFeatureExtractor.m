@implementation PGPOIFeatureExtractor

- (PGPOIFeatureExtractor)initWithError:(id *)a3
{
  return -[PGPOIFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGPOIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PGPOIFeatureExtractor *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;

  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelForEmptyRelationForVersion:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_rawLabelsForVersion:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMomentNode poiOfMoment](PGGraphMomentNode, "poiOfMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = 3221225472;
  v16[2] = __47__PGPOIFeatureExtractor_initWithVersion_error___block_invoke;
  v16[3] = &unk_1E84280C0;
  v17 = v10;
  v18 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPOIFeatureExtractor;
  v16[0] = MEMORY[0x1E0C809B0];
  v12 = v10;
  v13 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForEmptyRelation:labelForTargetBlock:](&v15, sel_initWithName_featureNames_relation_labelForEmptyRelation_labelForTargetBlock_, CFSTR("POI"), v6, v11, v7, v16);

  return v13;
}

id __47__PGPOIFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  objc_msgSend(a2, "label");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    v4 = CFSTR("None");

    v3 = CFSTR("None");
  }
  +[PGPOIFeatureExtractor _labelProcessingForVersion:label:](PGPOIFeatureExtractor, "_labelProcessingForVersion:label:", *(_QWORD *)(a1 + 40), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)prefix
{
  return CFSTR("POI");
}

+ (id)_rawLabelsForVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[12];
  _QWORD v22[17];

  v22[16] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 != 3)
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
      return v19;
    }
    v14 = *MEMORY[0x1E0D4AFD0];
    v21[0] = *MEMORY[0x1E0D4AFE8];
    v21[1] = v14;
    v15 = *MEMORY[0x1E0D4AF98];
    v21[2] = *MEMORY[0x1E0D4B000];
    v21[3] = v15;
    v16 = *MEMORY[0x1E0D4AFA8];
    v21[4] = *MEMORY[0x1E0D4AFC8];
    v21[5] = v16;
    v17 = *MEMORY[0x1E0D4AFD8];
    v21[6] = *MEMORY[0x1E0D4AF90];
    v21[7] = v17;
    v18 = *MEMORY[0x1E0D4AF88];
    v21[8] = *MEMORY[0x1E0D4AFF8];
    v21[9] = v18;
    v21[10] = *MEMORY[0x1E0D4AFB8];
    v21[11] = CFSTR("None");
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v21;
    v13 = 12;
  }
  else
  {
    v3 = *MEMORY[0x1E0D4AFD0];
    v22[0] = *MEMORY[0x1E0D4AFE8];
    v22[1] = v3;
    v4 = *MEMORY[0x1E0D4B000];
    v22[2] = *MEMORY[0x1E0D4AFF0];
    v22[3] = v4;
    v5 = *MEMORY[0x1E0D4AFC8];
    v22[4] = *MEMORY[0x1E0D4AF98];
    v22[5] = v5;
    v6 = *MEMORY[0x1E0D4AF90];
    v22[6] = *MEMORY[0x1E0D4AFA8];
    v22[7] = v6;
    v7 = *MEMORY[0x1E0D4AFE0];
    v22[8] = *MEMORY[0x1E0D4AFD8];
    v22[9] = v7;
    v8 = *MEMORY[0x1E0D4AF88];
    v22[10] = *MEMORY[0x1E0D4AFF8];
    v22[11] = v8;
    v9 = *MEMORY[0x1E0D4AFB8];
    v22[12] = *MEMORY[0x1E0D4AFA0];
    v22[13] = v9;
    v10 = *MEMORY[0x1E0D4AFC0];
    v22[14] = *MEMORY[0x1E0D4AFB0];
    v22[15] = v10;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v22;
    v13 = 16;
  }
  objc_msgSend(v11, "arrayWithObjects:count:", v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_rawLabelsForVersion:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = a4;
  v7 = v6;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
      v10 = (__CFString *)v6;
    else
      v10 = CFSTR("unknown");
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "prefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@"), v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)_labelForEmptyRelationForVersion:(int64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;

  if (a3 == 3)
  {
    v4 = CFSTR("None");
    v5 = CFSTR("None");
    objc_msgSend(a1, "_labelProcessingForVersion:label:", 3, CFSTR("None"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  return v6;
}

@end
