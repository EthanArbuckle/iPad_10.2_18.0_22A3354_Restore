@implementation PGPublicEventCategoryFeatureExtractor

- (PGPublicEventCategoryFeatureExtractor)initWithError:(id *)a3
{
  return -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGPublicEventCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
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
  id v16;
  PGPublicEventCategoryFeatureExtractor *v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  int64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_processedLabelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_rawLabelsForVersion:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode publicEventOfMoment](PGGraphMomentNode, "publicEventOfMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  +[PGGraphPublicEventNode categoryOfPublicEvent](PGGraphPublicEventNode, "categoryOfPublicEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chain:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_labelProcessingForVersion:label:", a3, CFSTR("None"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = 3221225472;
  v20[2] = __63__PGPublicEventCategoryFeatureExtractor_initWithVersion_error___block_invoke;
  v20[3] = &unk_1E8428A78;
  v21 = v9;
  v22 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventCategoryFeatureExtractor;
  v20[0] = MEMORY[0x1E0C809B0];
  v16 = v9;
  v17 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForEmptyRelation:labelForTargetBlock:](&v19, sel_initWithName_featureNames_relation_labelForEmptyRelation_labelForTargetBlock_, CFSTR("PublicEventCategory"), v6, v14, v15, v20);

  return v17;
}

id __63__PGPublicEventCategoryFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
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
  +[PGPublicEventCategoryFeatureExtractor _labelProcessingForVersion:label:](PGPublicEventCategoryFeatureExtractor, "_labelProcessingForVersion:label:", *(_QWORD *)(a1 + 40), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)prefix
{
  return CFSTR("PublicEvent");
}

+ (id)_processedLabelsForVersion:(int64_t)a3
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

+ (id)_rawLabelsForVersion:(int64_t)a3
{
  void *v4;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) < 2)
    return &unk_1E84E95E0;
  if (a3 == 3)
  {
    v5[0] = CFSTR("GEOSpatialEventLookupCategoryArtsAndMuseums");
    v5[1] = CFSTR("GEOSpatialEventLookupCategoryDance");
    v5[2] = CFSTR("GEOSpatialEventLookupCategoryFestivalsAndFairs");
    v5[3] = CFSTR("GEOSpatialEventLookupCategoryMusicConcerts");
    v5[4] = CFSTR("GEOSpatialEventLookupCategoryNightLife");
    v5[5] = CFSTR("GEOSpatialEventLookupCategorySports");
    v5[6] = CFSTR("GEOSpatialEventLookupCategoryTheater");
    v5[7] = CFSTR("None");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = CFSTR("None");
  v7 = CFSTR("None");
  if ((unint64_t)(a3 - 2) < 2)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("GEOSpatialEventLookupCategory"), &stru_1E8436F28);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v10, v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v6 = (__CFString *)v5;
    v8 = CFSTR("None");
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

@end
