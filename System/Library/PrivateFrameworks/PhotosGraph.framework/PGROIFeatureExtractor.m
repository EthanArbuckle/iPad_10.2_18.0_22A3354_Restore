@implementation PGROIFeatureExtractor

- (PGROIFeatureExtractor)initWithError:(id *)a3
{
  return -[PGROIFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGROIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PGROIFeatureExtractor *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = 3221225472;
  v12[2] = __47__PGROIFeatureExtractor_initWithVersion_error___block_invoke;
  v12[3] = &unk_1E842E7C0;
  v13 = v6;
  v11.receiver = self;
  v11.super_class = (Class)PGROIFeatureExtractor;
  v12[0] = MEMORY[0x1E0C809B0];
  v8 = v6;
  v9 = -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForEmptyRelation:labelForTargetBlock:](&v11, sel_initWithName_featureNames_relation_labelForEmptyRelation_labelForTargetBlock_, CFSTR("ROI"), v5, v7, CFSTR("None"), v12);

  return v9;
}

__CFString *__47__PGROIFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "label");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    v4 = CFSTR("None");

    v3 = CFSTR("None");
  }
  return v3;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v8 = *MEMORY[0x1E0D4B018];
    v12 = *MEMORY[0x1E0D4B020];
    v13 = v8;
    v9 = *MEMORY[0x1E0D4B028];
    v14 = *MEMORY[0x1E0D4B030];
    v15 = v9;
    v16 = *MEMORY[0x1E0D4B010];
    v17 = CFSTR("None");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v12;
    v7 = 6;
  }
  else
  {
    if (a3 != 1)
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
      return v10;
    }
    v3 = *MEMORY[0x1E0D4B018];
    v18 = *MEMORY[0x1E0D4B020];
    v19 = v3;
    v4 = *MEMORY[0x1E0D4B028];
    v20 = *MEMORY[0x1E0D4B030];
    v21 = v4;
    v22 = *MEMORY[0x1E0D4B010];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v18;
    v7 = 5;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

@end
