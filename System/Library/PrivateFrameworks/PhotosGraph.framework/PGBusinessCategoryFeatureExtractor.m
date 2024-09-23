@implementation PGBusinessCategoryFeatureExtractor

- (PGBusinessCategoryFeatureExtractor)initWithError:(id *)a3
{
  return -[PGBusinessCategoryFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGBusinessCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGBusinessCategoryFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode businessOfMoment](PGGraphMomentNode, "businessOfMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  +[PGGraphBusinessNode categoryOfBusiness](PGGraphBusinessNode, "categoryOfBusiness");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = 3221225472;
  v15[2] = __60__PGBusinessCategoryFeatureExtractor_initWithVersion_error___block_invoke;
  v15[3] = &__block_descriptor_40_e51___NSString_24__0__PGGraphBusinessCategoryNode_8__16l;
  v15[4] = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGBusinessCategoryFeatureExtractor;
  v15[0] = MEMORY[0x1E0C809B0];
  v12 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Business Category"), v6, v11, v15);

  return v12;
}

id __60__PGBusinessCategoryFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGBusinessCategoryFeatureExtractor _labelProcessingForVersion:label:](PGBusinessCategoryFeatureExtractor, "_labelProcessingForVersion:label:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)prefix
{
  return CFSTR("Business");
}

+ (id)_labelsForVersion:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) >= 2)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  else
    v5 = &unk_1E84EA7E0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v6;
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v10, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3 == 1)
  {
    v8 = (__CFString *)v6;
  }
  else
  {
    v8 = CFSTR("unknown");
  }

  return v8;
}

@end
